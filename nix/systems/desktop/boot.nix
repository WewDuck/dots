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

    # Set systemd timeout
  systemd.extraConfig = "
  DefaultTimeoutStopSec=10s
  DefaultTimeoutStartSec=10s
";
  
  # Set Linux Kernel Version.
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
