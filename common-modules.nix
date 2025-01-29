{
  inputs,
  user,
  system,
}:
[
  ./configuration.nix
  ./platform/desktop
  ./specific/system-specific/Laptop8P
  ./specific/hardware-specific/Laptop8P
  ./specific/user-specific
  ./lanzaboote.nix
  ./home-manager.nix

  inputs.nixos-hardware.nixosModules.omen-16-n0005ne
  inputs.impermanence.nixosModules.impermanence
  inputs.lanzaboote.nixosModules.lanzaboote
  inputs.home-manager.nixosModules.home-manager
  inputs.aagl.nixosModules.default
  inputs.flake-programs-sqlite.nixosModules.programs-sqlite

  { nixpkgs.config.allowUnfree = true; }
]
