{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    btop
    # nvtopPackages.full
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
    unzip
    nixfmt-rfc-style
    p7zip
    wine
    winetricks
    clang-tools
    any-nix-shell
    amdgpu_top
  ];
}
