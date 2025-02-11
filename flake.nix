{
  description = "DarkAir's Flake";

  inputs = {
    # use mirror of nixpkgs ot replace official nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";

    nixos-hardware.url = "git+https://github.com/nixos/nixos-hardware.git?shallow=1&ref=master";
    impermanence.url = "git+https://github.com/nix-community/impermanence.git?shallow=1&ref=master";

    lanzaboote.url = "git+https://github.com/nix-community/lanzaboote.git?shallow=1&ref=master";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "git+https://github.com/ezKEa/aagl-gtk-on-nix.git?shallow=1&ref=main";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    flake-programs-sqlite.url = "git+https://github.com/wamserma/flake-programs-sqlite.git?shallow=1&ref=main";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme.url = "git+https://github.com/rafaelmardojai/firefox-gnome-theme.git?shallow=1&ref=master";
    firefox-gnome-theme.flake = false;

    nix-vscode-extensions.url = "git+https://github.com/nix-community/nix-vscode-extensions.git?shallow=1&ref=master";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "git+https://github.com/Gerg-L/spicetify-nix.git?shallow=1&ref=master";
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
