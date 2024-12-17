{
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/daed"
      "/etc/secureboot"
      "/etc/nixos"
      "/var/log"
      "/var/lib"
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  # needs disabled when initial of reinstall system
  # boot.initrd.systemd.suppressedUnits = [ "systemd-machine-id-commit.service" ];
  # systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
}
