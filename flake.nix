{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {  self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    homeConfigurations = {
      ib = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          # Import home-manager profile
          ./nix/users/ib     
          # Enable flakes and nix command
          { nix = { package = pkgs.nix; settings.experimental-features = [ "nix-command" "flakes" ];}; }
          # Pin registry to flake
          { nix.registry.nixpkgs.flake = nixpkgs; }
          # Pin channel to flake 
          { home.sessionVariables.NIX_PATH = "nixpkgs=nixpkgs=flake:nixpkgs$\{NIX_PATH:+:$NIX_PATH}"; }
        ];
      };
    };
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; 
        modules = [
          # Import system profile
          ./nix/systems/desktop
          # Enable flakes and nix command
          { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
          # Pin registry to flake
          { nix.registry.nixpkgs.flake = nixpkgs; }
          # Pin channel to flake 
          { nix.nixPath = [ "nixpkgs=configflake:nixpkgs" ]; }
        ];
      };
            ip = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; 
        modules = [
          # Import system profile
          ./nix/systems/ip
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
