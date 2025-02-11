{
  description = "DarkAir's Nixos LiveCD Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # daeuniverse stable version
    daeuniverse.url = "github:daeuniverse/flake.nix";
    daeuniverse.inputs.nixpkgs.follows = "nixpkgs";
    # AAGL  genshin impact etc... game launcher
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    # flake-programs-sqlite
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
    # firefox-gnome-theme
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        gnome = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs system;
            user = "nixos";
          };
          modules = with inputs; [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            ./livecd.nix
            # ../HM
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            daeuniverse.nixosModules.daed
            flake-programs-sqlite.nixosModules.programs-sqlite
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
        # plasma6 = nixpkgs.lib.nixosSystem
        #   rec {
        #     system = "x86_64-linux";
        #     specialArgs = {
        #       inherit inputs system;
        #       user = "nixos";
        #     };
        #     modules = with inputs;[
        #       "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma6.nix"
        #       home-manager.nixosModules.home-manager
        #       aagl.nixosModules.default
        #       daeuniverse.nixosModules.daed
        #       flake-programs-sqlite.nixosModules.programs-sqlite
        #       { nixpkgs.config.allowUnfree = true; }
        #     ];
        #   };
      };
    };
}
