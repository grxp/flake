{
  programs.home-manager.enable = true;

  imports = [
    ./env.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./programs
    # ./shell.nix
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

  home.stateVersion = "24.11";
}
