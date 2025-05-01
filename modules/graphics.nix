{ pkgs, ... }:
{

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  hardware = {
    amdgpu.initrd.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };
    nvidia = {
      nvidiaPersistenced = true;
      open = true;
      dynamicBoost.enable = true;
      modesetting.enable = true;
    };
  };

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
