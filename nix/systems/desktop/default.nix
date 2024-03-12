  { ... }:
  {
    # Imports
      imports = [
	../base/configuration.nix
	../base/gaming.nix
	./nvidia.nix
	./hardware-configuration.nix
	./boot.nix
      ];
  } 
