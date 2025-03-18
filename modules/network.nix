{ pkgs, ... }:
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
  networking.nftables.enable = true;
  # systemd.services.daed = {
  #   wantedBy = [ "multi-user.target" ];
  #   after = [
  #     "network-online.target"
  #     "systemd-sysctl.service"
  #   ];
  #   wants = [ "network-online.target" ];
  #
  #   preStart = ''
  #     umask 0077
  #     mkdir -p /etc/daed
  #     ln -sfn ${pkgs.v2ray-geoip}/share/v2ray/geoip.dat /etc/daed/
  #     ln -sfn ${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat /etc/daed/
  #   '';
  #   serviceConfig = {
  #     Type = "simple";
  #     User = "root";
  #     LimitNPROC = 512;
  #     LimitNOFILE = 1048576;
  #     ExecStart = "${pkgs.daed}/bin/daed run -c /etc/daed -l 127.0.0.1:2023";
  #     Restart = "on-abnormal";
  #   };
  # };

  environment.systemPackages = [
    pkgs.daed
    pkgs.dae
  ];

  # services.dae.enable = true;
  # services.dae.configFile = "/etc/dae/config.dae";
  programs.clash-verge.enable = true;

}
