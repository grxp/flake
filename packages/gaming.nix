{ inputs, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.gamescope.enable = true;

  programs.gamemode.enable = true;
  programs.honkers-railway-launcher.enable = true;
}
