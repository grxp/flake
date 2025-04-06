{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.zsh.enable = true;
  # programs.zsh.enableCompletion = false;
  users.users.darkair.shell = "/run/current-system/sw/bin/fish";
  users.users.root.shell = "/run/current-system/sw/bin/fish";
  environment.systemPackages = with pkgs; [
    fish
    zsh
  ];
}
