{ inputs, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # gamescopeSession.enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play, but i don't need
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.gamescope.enable = true;
  # programs.gamescope.capSysNice = true;

  programs.gamemode.enable = true;

  # nix.settings = inputs.aagl.nixConfig; # Set up Cachix
  # programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules

  # genshin impact global download accelerate
  # ip via autopatchcn.yuanshen.com.wsdvs.com.  autopatchhk.yuanshen.com

  # programs.anime-borb-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  # programs.honkers-launcher.enable = true;
  # programs.wavey-launcher.enable = true;
  # programs.sleepy-launcher.enable = true;
}