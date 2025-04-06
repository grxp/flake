{
  hardware.amdgpu.initrd.enable = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  hardware.nvidia.open = true;
  hardware.nvidia.dynamicBoost.enable = true; # Power limit

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
