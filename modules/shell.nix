{ pkgs, ... }: {
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  # users.users.root.shell = "/run/current-system/sw/bin/fish";
  environment.systemPackages = with pkgs; [fish zsh]; 
}
