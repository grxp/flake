{ pkgs, ... }:
{
  hardware.amdgpu.initrd.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  hardware.nvidia.open = true;
  hardware.nvidia.dynamicBoost.enable = true; # Power limit

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
