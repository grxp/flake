{
  programs.home-manager.enable = true;

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  imports = [
    ./env.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./programs
    ./shell.nix
  ];

  programs.mangohud.enable = true;
  # kitty
  programs.kitty = {
    enable = true;
    settings.background_opacity = "0.95";
  };
  # lorri
  services.lorri.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.java.enable = true;
  programs.lazygit = {
    enable = true;
    settings.git.paging.externalDiffCommand = "difft";
  };

  home.stateVersion = "24.11";
}
