{ lib, stdenv, kernel, kernelModuleMakeFlags }:

let
  modulePath = "sound/hda/codecs/realtek";
in
stdenv.mkDerivation {
  pname = "fix-led";
  inherit (kernel) src version;

  nativeBuildInputs = kernel.moduleBuildDependencies;

  patches = [ ./patches/hp_omen_mute_led_patch.patch ];

  hardeningDisable = [ "pic" ];
  enableParallelBuilding = true;

  makeFlags = kernelModuleMakeFlags ++ [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(PWD)/${modulePath}"
  ];

  buildFlags = [ "modules" ];
  installFlags = [ "INSTALL_MOD_PATH=${placeholder "out"}" ];
  installTargets = [ "modules_install" ];

  meta = {
    description = "fix-led";
    license = lib.licenses.gpl3;
  };
}
