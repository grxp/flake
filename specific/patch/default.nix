{ pkgs, config, ... }:
let
  fix-led = config.boot.kernelPackages.callPackage ./package.nix { };
in
{
  boot.extraModulePackages = [ fix-led ];
}
