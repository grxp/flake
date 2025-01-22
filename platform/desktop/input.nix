{
  # Enable Wayland for NixOS 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Enable Wayland for Chromium (CEF) Apps using home-manger
  # home.sessionVariables.NIXOS_OZONE_WL = "1";
  # Using vulkan renderer for gtk4
  # home.sessionVariables.GSK_RENDERER = "vulkan";

  # Enable Wayland IME for some useful apps in nix repack processing
  nixpkgs.overlays = [
    (self: super: {
      mutter = super.mutter.overrideAttrs (oldAttrs: {
        patches = oldAttrs.patches or [ ]
          ++ [ ./wayland-text-input-v1-Implement-basic-text-input-v1-.patch ];
      });
    })
  ];
}
