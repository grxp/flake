{ config, ... }:
{

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.open = true;
  hardware.nvidia.dynamicBoost.enable = true; # Power limit

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
