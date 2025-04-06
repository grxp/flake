{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.libsForQt5.breeze-qt5;
    name = "breeze_cursors";
    gtk.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita";
  };

  home.packages = with pkgs; [
    adw-gtk3
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3";
    };
  };

}
