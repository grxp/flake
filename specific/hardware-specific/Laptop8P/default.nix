{
  imports = [
    # useing nixos-hardware modules to replaced
    ./nvidia
    ./features/fix-keycode.nix
    ./features/udev.nix
  ];
}
