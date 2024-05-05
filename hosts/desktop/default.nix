  { ... }:
  {
    # Imports
      imports = [
	/home/ib/dots/modules/system/etc.nix
	/home/ib/dots/modules/system/gaming.nix
	/home/ib/dots/modules/system/localization.nix
	/home/ib/dots/modules/system/nvidia.nix
#	/home/ib/dots/users/ib/home.nix
#	/home/ib/dots/modules/hm/themes/default.nix
	./hardware-configuration.nix
	./boot.nix
      ];

        # Hostname 
        networking.hostName = "desktop"; 
  }

