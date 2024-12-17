{ lib
, inputs
, ...
}:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
      "ca-derivations"
    ];
    trusted-users = [
      "@wheel"
    ];
    # Substituters
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      # "https://cache.nixos.org"
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  # Optimize nix store by using hard-link
  nix.settings.auto-optimise-store = true;

  # # Automatic GC
  # nix.gc = {
  #   automatic = true;
  #   dates = "daily";
  #   options = "--delete-older-than 7d";
  # };

  # # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
  # nix.registry.nixpkgs.flake = inputs.nixpkgs;
  # nix.channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead.

  # # but NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake.
  # # Make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
  # environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  # # https://github.com/NixOS/nix/issues/9574
  # nix.settings.nix-path = lib.mkDefault "nixpkgs=/etc/nix/inputs/nixpkgs";
}
