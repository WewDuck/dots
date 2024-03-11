  { ... }:
  {
    # Imports
      imports = [
	../base/configuration.nix
	./nvidia.nix
	./hardware-configuration.nix
	./boot.nix
      ];
  } 
