{
  imports = [
    ./modules/sudo.nix
    ./modules/network/firewall.nix
    ./modules/network/proxy.nix
    ./modules/network/tailscale.nix
    # ./modules/features/ollama.nix # disabled because call gpu 
    ./modules/features/waydroid.nix
  ];
  # services.gns3-server.enable = true;
  # services.gns3-server.ubridge.enable = true;
  programs.mininet.enable = true;
}
