{ lib
, config
, ...
}:
{
  networking.hostName = "Laptop8P"; # Define hostname.

  # Reserve one core to prevent the system from freezing
  nix.settings.cores = 15;

  # Enable tlp power profile mangement
  # services.tlp.enable = lib.mkDefault ((lib.versionOlder (lib.versions.majorMinor lib.version) "21.05")
  #   || !config.services.power-profiles-daemon.enable);
  imports = [
    ./plymouth.nix
    ./btrfs-scrub.nix
    ./hardware-configuration.nix
    ./persistence.nix
    #  ./patch
  ];
}
