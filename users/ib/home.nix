{ pkgs, ... }:
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
    packages = with pkgs; [
	  armcord
          firefox
          floorp
          neofetch
          hyfetch
	  cava
          cbonsai
          cmatrix
          lavat
          ookla-speedtest
          cfspeedtest
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
          alacritty
          foot
          kitty
          krita
          rofi-wayland
          nicotine-plus
          kdenlive
          transmission-qt
          transmission
          obs-studio

    ];
  };

  imports = [
    ~/dots/modules/hm/themes/default.nix
  ];

}
