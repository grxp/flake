{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    axel
    git
    vim
    neovim
    wl-clipboard
    bat
    lsd
    tmux
    smartmontools
    dnsutils
    q
    dogdns
    clang
    go
    rustup
    gcc
    gdb
    python3
  ];
  programs.adb.enable = true;
}
