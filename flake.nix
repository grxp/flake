{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    firefox-gnome-theme.flake = false;

    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.Laptop8P = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          user = "darkair";
        };
        modules = with inputs; [
          ./configuration.nix
          impermanence.nixosModules.impermanence
          flake-programs-sqlite.nixosModules.programs-sqlite
          home-manager.nixosModules.home-manager
          aagl.nixosModules.default
          {
            nixpkgs.config.allowUnfree = true;

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
