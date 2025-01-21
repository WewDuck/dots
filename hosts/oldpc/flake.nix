{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nh.url = "github:viperml/nh";

  };

  outputs = {  self, nixpkgs, nh, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
           oldpc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; 
        modules = [
          # Import system profile
          ./default.nix
          # Enable flakes and nix command
          { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
          # Pin registry to flake
          { nix.registry.nixpkgs.flake = nixpkgs; }
          # Pin channel to flake 
          { nix.nixPath = [ "nixpkgs=configflake:nixpkgs" ]; }

        ];
      };
    };
  };
}
