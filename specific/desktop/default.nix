{ lib, ... }:
{
  imports = [
    ./gnome
    ./pipewire.nix
  ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.desktopManager.deepin.enable = true;
  services.flatpak.enable = true;

  specialisation =
    lib.mapAttrs
      (name: config: {
        configuration = {
          system.nixos.tags = [ name ];
          disabledModules = [ ./gnome ];
        }
        // config;
      })
      {
        "Plasma" = {
          imports = [ ./Plasma.nix ];
        };
      };
}
