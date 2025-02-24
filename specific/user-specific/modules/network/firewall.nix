_: {
  networking.nftables.enable = true;

  # Firewall Ports
  # 3389  RDP            TCP
  # 15234 Landrop        TCP
  # 4455  OBS Websocket  TCP
  # 7000  Uxplay         TCP
  # 7100  Uxplay         TCP
  # 6000  Uxplay         UDP
  # 6001  Uxplay         UDP
  # 7011  Uxplay         UDP
  # 51820 Wireguard      UDP (Configured via NetworkManager)

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    15234
    4455
  ];
  networking.firewall.allowedUDPPorts = [ ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
