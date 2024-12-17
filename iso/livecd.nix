_: {
  imports = [
    # desktop platform modules
    ../desktop
    # modules/basic
    ../modules/i18n.nix
    ../modules/network.nix
    ../modules/shell.nix
    ../modules/nix.nix
    # modules/features
    ../modules/features/virtualisation.nix
    ../modules/features/docker.nix
    # package
    ../packages
    ../packages/gaming.nix
  ];

  isoImage.squashfsCompression = "zstd";
}