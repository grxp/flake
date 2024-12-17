{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System information tool
    neofetch
    hyfetch
    fastfetch
    screenfetch
    cpufetch
    powertop
    bottom
    btop
    nvtopPackages.full
    # Terminal utils
    lolcat
    cmatrix
    # Alternative to ls/cat
    bat
    lsd
    # Diff
    difftastic
    yazi 
    # Screenshot
    grim
    slurp
    wl-clipboard
    # Network utils
    nali
    tcping-go
    gping
    # Wireless utils
    iw
    # Viedo tool
    ffmpeg
    # Desktop tools
    handlr
    xdotool
    # Netowrk tools
    iperf3
    nmap
    tcpdump
    pwru
    wgcf
    # Proxy
    # v2ray
    # xray
    # sing-box
    # tor
    # IMPI
    # ipmitool
    # Disk analayzer
    gdu
    duf
    # Develop Tools
    gh
    hugo
    devbox
    charm-freeze
    # Language Server
    nil
    # Nix Utils
    nix-output-monitor
    sops
    nurl
    nix-update
    # Other utils
    fd
    ripgrep
    openssl
    sshx
    tlrc
    p7zip
    # Wine
    wine
    winetricks
    # Binary Analayzer
    hexyl
    binwalk
  ];
}
