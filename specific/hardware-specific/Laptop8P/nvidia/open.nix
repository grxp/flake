{ config, ... }: {

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.open = true;
  hardware.nvidia.dynamicBoost.enable = true; # Power limit
  # hardware.nvidia.prime = {
  #   offload.enable = true;

  #   nvidiaBusId = "PCI:1:0:0";
  #   amdgpuBusId = "PCI:7:0:0"; # If you have an AMD iGPU
  # };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
