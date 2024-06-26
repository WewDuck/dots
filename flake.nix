{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap.url = "github:xremap/nix-flake";
    
    nh.url = "github:viperml/nh";

#   maxfetch.url = "github:jobcmax/maxfetch";
  };

  outputs = {  self, nixpkgs, nixpkgs-stable, home-manager, nh, xremap, ... }@inputs:
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
          ./users/ib/home.nix
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
          ./hosts/desktop/default.nix
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix

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
          ./hosts/ip
          # Enable flakes and nix command
          { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
          # Pin registry to flake
          { nix.registry.nixpkgs.flake = nixpkgs; }
          # Pin channel to flake 
          { nix.nixPath = [ "nixpkgs=configflake:nixpkgs" ]; }

        ];
      };

#         oldpc = nixpkgs.lib.nixosSystem {
#      inherit system;
#      specialArgs = { inherit inputs; }; 
#      modules = [
         # Import system profile
#        ./hosts/oldpc
         # Enable flakes and nix command
#        { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
         # Pin registry to flake
#        { nix.registry.nixpkgs.flake = nixpkgs; }
         # Pin channel to flake 
#        { nix.nixPath = [ "nixpkgs=configflake:nixpkgs" ]; }

#      ];
#     };
    };
  };
}
