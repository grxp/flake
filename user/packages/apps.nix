{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # android-studio
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
      ];
    })
    alacritty
    brave
    tdesktop
    qq
    # wechat-uos
    thunderbird
    # netease-cloud-music-gtk
    vlc
    mpv
    tsukimi
    # bottles
    obsidian
    # burpsuite
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        wineWowPackages.waylandFull
        pixman
        libjpeg
        zenity
        winetricks
        umu-launcher
      ];
    })
    umu-launcher
  ];
}
