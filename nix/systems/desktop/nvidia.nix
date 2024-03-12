{ pkgs, ... }:
{
   #  Load nvidia driver for Xorg and Wayland
   services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
    };

}
