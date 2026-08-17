{ config, ... }:
{
  xdg.dataFile."flatpak/overrides/global".text = ''
    [Context]
    filesystems=/nix/store:ro;/home/darkair/.icons:ro;/home/darkair/.local/share/fonts:ro;host-etc:ro;

    [Environment]
    FONTCONFIG_FILE=/home/darkair/.config/fontconfig/fonts.conf
  '';
  xdg.configFile."fontconfig/fonts.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
     <description>Reuse the host (NixOS) fontconfig inside flatpak sandboxes</description>
     <cachedir prefix="xdg">fontconfig</cachedir>
     <include ignore_missing="yes">/run/host/etc/static/fonts/conf.d</include>
    </fontconfig>
  '';
}
