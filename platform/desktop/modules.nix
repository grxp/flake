_: {
  imports = [
    # platform/modules/basic
    ../modules/fonts.nix
    ../modules/pipewire.nix
  ];
  hardware.bluetooth.enable = true;
  services.flatpak.enable = true;
}
