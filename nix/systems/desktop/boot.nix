{ pkgs, ... }:
{
  boot.loader = { 
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub ={
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
    };
  };
}
