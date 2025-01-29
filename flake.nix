{
  description = "DarkAir's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    firefox-gnome-theme.flake = false;

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      user = "darkair";

      laptop8pModules = import ./common-modules.nix {
        inherit inputs user;
        system = "x86_64-linux";
      };

      livecdModules = [
        "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
        ./iso/livecd.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.aagl.nixosModules.default
        inputs.daeuniverse.nixosModules.daed
        inputs.flake-programs-sqlite.nixosModules.programs-sqlite
        { nixpkgs.config.allowUnfree = true; }
      ];

    in
    {
      nixosConfigurations = {
        Laptop8P = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs user;
            system = "x86_64-linux";
          };
          modules = laptop8pModules;
        };

        livecd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            user = "nixos";
            system = "x86_64-linux";
          };
          modules = livecdModules;
        };
      };
    };
}
