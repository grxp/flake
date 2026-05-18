{
  # services.btrfs.autoScrub = {
  #   enable = true;
  #   interval = "monthly";
  # };

  imports = [
    ./desktop
    ./package.nix
    ./fix-keycode.nix
    ./udev.nix
    ./plymouth.nix
    ./patch
  ];
}
