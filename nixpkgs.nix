{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      chromium = prev.chromium.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      google-chrome = prev.google-chrome.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      brave = prev.brave.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      vscode = prev.vscode.override { commandLineArgs = [ "--wayland-text-input-version=3" ]; };
      qq = prev.qq.override { commandLineArgs = [ "--wayland-text-input-version=3" ]; };
      obsidian = prev.obsidian.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.pname} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });
    })
  ];

}
