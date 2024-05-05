  { ... }:
  {
    # Imports
      imports = [
	~/dots/modules/system/etc.nix
	~/dots/modules/system/gaming.nix
	~/dots/modules/system/localization.nix
	~/dots/modules/system/nvidia.nix
	~/dots/users/ib/home.nix
	~/dots/modules/hm/themes/default.nix
	./hardware-configuration.nix
	./boot.nix
      ];

        # Hostname 
        networking.hostName = "desktop"; 
  }

