{ inputs, ... }:
{
  programs.home-manager.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./desktop
    ./settings/flatpak.nix
    ./settings/gtk.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./programs/firefox.nix
    ./programs/shell.nix
    ./programs/vscode.nix
    ./programs/jetbrains.nix
    ./programs/obs-studio.nix
    ./programs/spicetify.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/gpg.nix
  ];

  programs.mangohud.enable = true;
  # kitty
  programs.kitty = {
    enable = true;
    themeFile = "adwaita_dark";
    settings.background_opacity = "0.95";
  };
  # lorri
  services.lorri.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.java.enable = true;

  home.stateVersion = "24.05";
}
