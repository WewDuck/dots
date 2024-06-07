  { ... }:
  {
    # Imports
      imports = [
	../../modules/system/etc.nix
	../../modules/system/envvars.nix
	../../modules/system/kde.nix
	../../modules/system/gaming.nix
	../../modules/system/localization.nix
     	../../modules/system/nvidia.nix
	../../modules/system/shell.nix
	../../modules/system/xserver.nix
	../../modules/system/audio.nix
	../../modules/system/sway.nix
#../../users/ib/home.nix
	./hardware-configuration.nix
	./boot.nix
      ];

  
        # Hostname 
        networking.hostName = "desktop"; 

	system.stateVersion = "23.11"; 
  }

