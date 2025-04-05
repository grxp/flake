{ pkgs, config, ... }:
let
  fix-led = pkgs.callPackage ./package.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot.extraModulePackages = [
    (fix-led.overrideAttrs (_: {
      patches = [ ./patches/hp_omen_mute_led_patch.patch ];
    }))
  ];
}
