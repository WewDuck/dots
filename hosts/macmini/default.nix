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

];

networking.hostName = "macmini-nixos";

system.stateVersion = "24.05";

}
