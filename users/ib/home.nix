{ ... }:
{
  
  users.ib = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirt" ];
  }

  programs.home-manager.enable = true;
  home = {
    username = "ib";
    homeDirectory = "/home/ib"; 
    stateVersion = "23.11"; 
    packages = [
      armcord
      firefox
      floorp
      neofetch
      cava
      cbonsai
      cmatrix
      lavat
      speedtest-cli
      pfetch
      kate
      kcolorchooser
      vlc
      via
      rpi-imager
      wl-clipboard
      xclip
      tldr
      typioca
    ];
  };

  imports = [
    ~/dots/modules/hm/themes/default.nix
  ];

}
