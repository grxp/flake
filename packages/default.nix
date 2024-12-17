{ pkgs
, inputs
, ...
}:
{
  environment.systemPackages = with pkgs;
    [
      # Download Tools
      wget
      axel
      curlHTTP3
      # Editor & VCS
      git
      vim
      neovim
      nano
      # Basic Tools
      htop
      tmux
      # Devices
      pciutils
      usbutils
      smartmontools
      # Network
      inetutils
      dnsutils
      q
      dogdns
      ethtool
      trippy
      # Graphics
      vulkan-tools
      mesa-demos
      # Video Codec
      libva-utils
      # Sensors
      lm_sensors
      # Rsync
      rsync
      # Compiler
      clang
      go
      rustup
      gcc
      gdb
      # Runtime
      nodejs
      yarn
      python3
    ];
  programs.virt-manager.enable = true;
  programs.adb.enable = true;
  programs.iotop.enable = true;
  programs.iftop.enable = true;
  programs.wireshark.enable = true;
  programs.trippy.enable = true;
}
