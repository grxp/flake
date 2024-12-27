{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    btop
    nvtopPackages.full
    lolcat
    difftastic
    yazi
    nali
    nmap
    tcpdump
    pwru
    gdu
    duf
    nil
    nix-output-monitor
    fd
    ripgrep
    openssl
    tlrc
    p7zip
    wine
    winetricks
  ];
}
