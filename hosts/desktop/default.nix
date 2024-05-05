  { ... }:
  {
    # Imports
      imports = [
	../base/configuration.nix
	../base/gaming.nix
	../base/localization.nix
	./envvars.nix
	#../../users/ib/default.nix
	./nvidia.nix
	./hardware-configuration.nix
	./boot.nix
      ];

        # Hostname 
        networking.hostName = "desktop"; 
  }

