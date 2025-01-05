{ pkgs, ... }: {
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
    source ~/.config/fish/conf.d/*.fish
    source ~/.config/fish/functions/*.fish
  '';
  # programs.nushell.enable = true;

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };
}
