{ lib, ... }:
{
  # Reserve one core to prevent the system from freezing
  nix.settings.cores = 15;

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
    substituters = lib.mkForce [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      # "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  # Optimize nix store by using hard-link
  nix.settings.auto-optimise-store = true;

  # Automatic GC
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

}
