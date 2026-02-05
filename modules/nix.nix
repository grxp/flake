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
    substituters = [
      "https://cache.nixos.org"
      #  "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      # "https://cache.garnix.io"
      "https://ezkea.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  # Optimize nix store by using hard-link
  nix.settings.auto-optimise-store = true;

  # Automatic GC
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

}
