{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clash-verge-rev
    android-studio
    alacritty
    google-chrome
    brave
    tdesktop
    qq
    wechat-uos
    thunderbird
    yesplaymusic
    ncspot
    newsflash
    komikku
    vlc
    (mpv-unwrapped.wrapper { mpv = mpv-unwrapped.override { cddaSupport = true; }; })
    tsukimi
    shortwave
    osu-lazer-bin
    lunar-client
    lutris
    bottles
    logseq
    obsidian
    wpsoffice-cn
    fragments
    virt-manager
    flameshot
    dconf-editor
    # gns3-gui
  ];
}
