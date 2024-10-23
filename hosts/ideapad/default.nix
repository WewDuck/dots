{...}:
{
  imports = [
    ../../modules/etc.nix
    ../../modules/envvars.nix
    ../../modules/kde.nix
    ../../modules/kde-x11.nix
    ../../modules/gaming.nix
    ../../modules/localization.nix
    ../../modules/shell.nix
    ../../modules/xserver.nix
    ../../modules/audio.nix
    ../../modules/nh.nix
    ../../modules/virtualisation.nix
    ./hardware-configuration.nix
    ./boot.nix
  ];


   networking.hostName = "ipad";
   
   system.stateVersion = "24.05";

}
