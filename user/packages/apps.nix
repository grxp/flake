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
    vlc
    (mpv-unwrapped.wrapper { mpv = mpv-unwrapped.override { cddaSupport = true; }; })
    tsukimi
    bottles
    obsidian
    wpsoffice-cn
    virt-manager
    flameshot
    dconf-editor
  ];
}
