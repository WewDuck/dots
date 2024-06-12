  { ... }:
  {
    # Imports
      imports = [
	../../modules/etc.nix
	../../modules/envvars.nix
#../../modules/system/kde.nix
	../../modules/gaming.nix
	../../modules/localization.nix
     	../../modules/nvidia.nix
	../../modules/shell.nix
	../../modules/xserver.nix
	../../modules/audio.nix
	../../modules/cinnamon.nix
	../../modules/nh.nix
	../../modules/virtualisation.nix
#	../../modules/system/sway.nix
#../../users/ib/home.nix
	./hardware-configuration.nix
	./boot.nix
      ];

  
        # Hostname 
        networking.hostName = "desktop"; 

	system.stateVersion = "23.11"; 
  }

