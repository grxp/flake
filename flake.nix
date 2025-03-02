{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";

    home-manager.url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme.url = "git+https://github.com/rafaelmardojai/firefox-gnome-theme.git?shallow=1&ref=master";
    firefox-gnome-theme.flake = false;

    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

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
          flake-programs-sqlite.nixosModules.programs-sqlite
          home-manager.nixosModules.home-manager
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
