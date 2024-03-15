  { ... }:
  {
    # Imports
      imports = [
	../base/configuration.nix
	../base/gaming.nix
	../base/envvars.nix
	./nvidia.nix
	./hardware-configuration.nix
	./boot.nix
      ];
  } 
