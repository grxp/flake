{ lib, ... }:
{
  imports = [
    # Using Gnome by default
    ./gnome
    # Basic modules for desktop
    ./modules.nix
    # Enable Wayland text input v1 for Gnome
    ./input.nix
  ];

  # specialisation =
  #   lib.mapAttrs
  #     (name: config: {
  #       configuration = {
  #         system.nixos.tags = [ name ];
  #         disabledModules = [ ./gnome ];
  #       } // config;
  #     })
  #     {
  #       # "Hyprland" = {
  #       #   imports = [ ./hyprland ];
  #       # };
  #       "Plasma" = {
  #         imports = [ ./plasma ];
  #       };
  #     };
}
