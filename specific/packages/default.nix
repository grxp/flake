{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
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
    trippy
    q
    dogdns
    clang
    go
    rustup
    gcc
    gdb
    python3
    nodejs
  ];
  programs.adb.enable = true;
  programs.wireshark.enable = true;
  programs.virt-manager.enable = true;
  programs.trippy.enable = true;
  programs.nexttrace.enable = true;
}
