{ pkgs, ... }:
{
  programs = {
    wireshark.enable = true;
    virt-manager.enable = true;
    trippy.enable = true;
    nexttrace.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Android
    android-tools

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
    # DNS tools
    q
    doggo
    # Program lang
    clang
    go
    rustup
    gcc
    gdb
    python3
    nodejs
    pnpm
  ];
}
