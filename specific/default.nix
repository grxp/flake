{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
  };

  imports = [
    ./desktop
    ./packages
    ./fix-keycode.nix
    ./udev.nix
    ./plymouth.nix
  ];
}
