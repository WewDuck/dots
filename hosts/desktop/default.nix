  { ... }:
  {
    # Imports
      imports = [
	../../modules/etc.nix
	../../modules/envvars.nix
  ../../modules/kde.nix
	../../modules/kde-x11.nix
#	../../modules/hyprland.nix
	../../modules/gaming.nix
	../../modules/localization.nix
#	../../modules/nvidia.nix
	../../modules/shell.nix
	../../modules/xserver.nix
	../../modules/audio.nix
#	../../modules/cinnamon.nix
#	../../modules/xfce.nix
#	../../modules/gnome.nix
	../../modules/nh.nix
	../../modules/virtualisation.nix
	../../modules/ld.nix
#	../../modules/system/sway.nix
	./hardware-configuration.nix
	./boot.nix
	./secret.nix
      ];

  
        # Hostname 
        networking.hostName = "desktop"; 

	system.stateVersion = "23.11"; 
  }

