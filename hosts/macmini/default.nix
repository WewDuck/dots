{...}:
{

imports = [
./hardware-configuration.nix
../../modules/nh.nix
../../modules/etc.nix
../../modules/audio.nix
../../modules/localization.nix
../../modules/shell.nix
../../modules/xserver.nix
../../modules/gaming.nix
../../modules/kde.nix

];

networking.hostName = "macmini-nixos";

system.stateVersion = "24.05";

  boot.loader = { 
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub ={
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = false;
      gfxmodeEfi = "1920x1080";
    };
   };

}
