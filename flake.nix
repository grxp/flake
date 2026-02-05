{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    firefox-gnome-theme.flake = false;

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      user = "darkair";
    in
    {
      nixosConfigurations.Laptop8P = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs user system;
          pkgs-stable = import inputs.nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = with inputs; [
          ./configuration.nix
          ./nixpkgs.nix
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager
          nix-index-database.nixosModules.nix-index
          aagl.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.darkair = import ./user/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit inputs user system;
            };
          }
        ];
      };
    };
}
