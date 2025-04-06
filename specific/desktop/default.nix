{
  imports = [
    # ./Plasma.nix
    ./gnome
    ./pipewire.nix
  ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.desktopManager.deepin.enable = true;
  # services.desktopManager.plasma6.enable = true;
  services.flatpak.enable = true;
}
