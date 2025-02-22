{
  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      resize-with-right-button = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Console";
    };
    "org/gnome/mutter".experimental-features = [
      "scale-monitor-framebuffer"
      "xwayland-native-scaling"
      "variable-refresh-rate"
    ];
  };
}
