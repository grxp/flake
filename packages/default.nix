{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    axel
    curlHTTP3
    git
    vim
    neovim
    wl-clipboard
    xclip
    bat
    lsd
    nano
    htop
    tmux
    smartmontools
    dnsutils
    q
    dogdns
    trippy
    clang
    go
    rustup
    gcc
    gdb
    # Runtime
    nodejs
    yarn
    python3
    # Headers
    glibc
  ];
  programs.virt-manager.enable = true;
  programs.adb.enable = true;
  programs.iotop.enable = true;
  programs.iftop.enable = true;
  programs.wireshark.enable = true;
  programs.trippy.enable = true;
}
