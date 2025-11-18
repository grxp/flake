{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    telegram-desktop
    qq
    wechat-uos
    thunderbird
    netease-cloud-music-gtk
    vlc
    mpv
    tsukimi
    obsidian
    wireshark-qt
    # qcm
    vscode
    umu-launcher
    prismlauncher
  ];
  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };
}
