{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  # networking.networkmanager.wifi.powersave = false; # disabled power save mode for most driver to keep network stable
  networking.networkmanager.wifi.backend = "iwd"; # Or Default:wpa_supplicant
  networking.wireless.iwd.settings = {
    DriverQuirks = {
      PowerSaveDisable = "mt7921e";
    };
  };

  networking.hostName = "Laptop8P"; # Define hostname.

  # Reserve one core to prevent the system from freezing
  nix.settings.cores = 15;

  imports = [
    ./plymouth.nix
    ./btrfs-scrub.nix
    ./hardware-configuration.nix
    ./persistence.nix
    #  ./patch
  ];
}
