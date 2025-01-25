{ pkgs, ... }:
{
  imports = [
    ./modules/sudo.nix
    ./modules/network/firewall.nix
    # ./modules/features/ollama.nix # disabled because call gpu
  ];
  # programs.mininet.enable = true;

  # virtualisation.waydroid.enable = true;

  # services.tailscale = {
  #   enable = true;
  #   useRoutingFeatures = "client";
  # };

  # services.dae =
  #   {
  #     enable = true;
  #     configFile = "/etc/dae";
  #   };

  systemd.services.daed = {
    wantedBy = [ "multi-user.target" ];
    after = [
      "network-online.target"
      "systemd-sysctl.service"
    ];
    wants = [ "network-online.target" ];

    preStart = ''
      umask 0077
      mkdir -p /etc/daed
      ln -sfn ${pkgs.v2ray-geoip}/share/v2ray/geoip.dat /etc/daed/
      ln -sfn ${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat /etc/daed/
    '';
    serviceConfig = {
      Type = "simple";
      User = "root";
      LimitNPROC = 512;
      LimitNOFILE = 1048576;
      ExecStart = "${pkgs.daed}/bin/daed run -c /etc/daed -l 127.0.0.1:2023";
      Restart = "on-abnormal";
    };
  };
  environment.systemPackages = [ pkgs.daed ];
  programs.clash-verge.enable = true;
}
