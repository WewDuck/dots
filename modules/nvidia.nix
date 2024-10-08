{ pkgs, config, ... }:
{
   #  Load nvidia driver for Xorg and Wayland
   services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
#     open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      forceFullCompositionPipeline = true;
    };
    
}
