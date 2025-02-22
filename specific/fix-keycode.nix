{
  systemd.services = {
    # This service is to fix failed to test on nixos-rebuild test of many times
    NetworkManager-wait-online.enable = false;

    setkeycodes = {
      description = "Set custom keycodes for specific scancodes to fix atkdb scroll issue of dmesg";
      after = [ "local-fs.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig.ExecStart = "/run/current-system/sw/bin/setkeycodes e02b 255";
    };
  };
}
