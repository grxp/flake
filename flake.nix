{
  description = "DarkAir's Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nix Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # Impermanence
    impermanence.url = "github:nix-community/impermanence";
    # NUR Packages
    # nur.url = "github:nix-community/NUR";
    # lanzaboote (Secure boot)
    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # daeuniverse
    # daeuniverse.url = "github:daeuniverse/flake.nix";
    # daeuniverse.inputs.nixpkgs.follows = "nixpkgs";
    # AAGL
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    # flake-programs-sqlite
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
    # firefox-gnome-theme
    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    firefox-gnome-theme.flake = false;
    # vscode-extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    # spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      user = "darkair";
    in
    {
      nixosConfigurations = {
        Laptop8P = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs user system; };
          modules = with inputs; [
            ./configuration.nix
            ./platform/desktop
            ./specific/system-specific/Laptop8P
            ./specific/hardware-specific/Laptop8P
            ./specific/user-specific
            ./lanzaboote.nix
            ./home-manager.nix
            # generic model for my laptop
            nixos-hardware.nixosModules.omen-16-n0005ne
            impermanence.nixosModules.impermanence
            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            # daeuniverse.nixosModules.daed
            flake-programs-sqlite.nixosModules.programs-sqlite
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
        livecd = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs system;
            user = "nixos";
          };
          modules = with inputs; [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            ./iso/livecd.nix
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            daeuniverse.nixosModules.daed
            flake-programs-sqlite.nixosModules.programs-sqlite
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
      };
    };
}
