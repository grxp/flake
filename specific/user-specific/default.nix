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
  services.daed.enable = true;

}
