{ ... }:
{
  programs.home-manager.enable = true;
  home = {
    username = "ib";
    homeDirectory = "/home/ib"; 
    stateVersion = "23.11"; 
  };

  imports = [
    ./themes/default.nix
  ];

}
