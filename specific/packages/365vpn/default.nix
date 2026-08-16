{ lib, stdenv, fetchurl, dpkg, autoPatchelfHook, makeWrapper, wrapGAppsHook3, gtk3, webkitgtk_4_1, glib, libsoup_3, pkg-config, gobject-introspection, systemd, glib-networking, dconf }:

let
  version = "26.7.17";
in stdenv.mkDerivation {
  pname = "365vpn";
  inherit version;

  src = fetchurl {
    url = "https://maoyun1.mhtwine.com/365-${version}-linux-amd64.deb?t=1782469165831";
    hash = "sha256-2WB9XBI0Z2KR+4SB7Ot/TJzk//fFfFiinggj3+xCUoE=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
    makeWrapper
    wrapGAppsHook3
    pkg-config
    gobject-introspection
  ];

  buildInputs = [
    gtk3
    webkitgtk_4_1
    glib
    libsoup_3
    systemd
    glib-networking
    dconf
  ];

  dontBuild = true;
  dontConfigure = true;

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib $out/share
    cp -r usr/share/* $out/share/
    install -Dm755 usr/bin/365vpn $out/bin/365vpn
    install -Dm755 usr/lib/365vpn/helper $out/lib/365vpn/helper

    runHook postInstall
  '';

  meta = {
    description = "365VPN Client";
    homepage = "https://365vpn.com";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = [ ];
  };
}
