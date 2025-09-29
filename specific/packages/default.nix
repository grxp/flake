{ pkgs, ... }:
{
  programs = {
    adb.enable = true;
    wireshark.enable = true;
    virt-manager.enable = true;
    trippy.enable = true;
    nexttrace.enable = true;
  };

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
}
