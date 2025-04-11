{
  pkgs,
  lib,
  options,
  user,
  ...
}:
{
  config =
    {
      # Enable the Deepin Desktop Environment.
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
    }
    // lib.optionalAttrs (options ? "home-manager") {
      home-manager.users.${user} = {
        home.packages =
          (with pkgs; [
            gnome-tweaks
            dconf-editor
            gnome-power-manager
            gnome-pomodoro
          ])
          ++ (with pkgs.gnomeExtensions; [
            appindicator
            gsconnect
            blur-my-shell
            dock-from-dash
            astra-monitor
            kimpanel
            pano
            # Extensions that no longer in use
            # openweather
            # tiling-assistant
            # burn-my-windows
          ]);

        imports = [
          ./dconf.nix
          ./theme.nix
        ];
      };
    };
}
