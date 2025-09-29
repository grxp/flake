{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    tdesktop
    qq
    wechat-uos
    thunderbird
    netease-cloud-music-gtk
    vlc
    mpv
    tsukimi
    obsidian
    wireshark-qt
    qcm
    vscode
    umu-launcher
    prismlauncher
  ];
}
