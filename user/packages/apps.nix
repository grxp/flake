{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # android-studio
    # zed-editor
    anki-bin
    tdesktop
    qq
    wechat-uos
    thunderbird
    netease-cloud-music-gtk
    vlc
    mpv
    tsukimi
    # bottles
    obsidian
    wireshark-qt
    qcm
    vscode
    # burpsuite
    umu-launcher
    prismlauncher
  ];
}
