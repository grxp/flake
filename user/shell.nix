{ pkgs, ... }:
{
  programs.fish.enable = true;
  # programs.fish.generateCompletions = false;
  programs.fish.interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';

  programs.nushell.enable = true;

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };
}
