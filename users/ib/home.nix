{ config, pkgs, inputs, ... }:
{

 programs.home-manager.enable = true;
# home-manager.users.ib = { pkgs, ... }: { 
  home = {
    username = "ib";
    homeDirectory = "/home/ib"; 
    stateVersion = "23.11"; 
    packages = with pkgs; [
        vesktop
        firefox
#       floorp
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
        mpv
        rpi-imager
        wl-clipboard
        xclip
        tldr
        typioca
        foot
        kitty
        krita
        rofi-wayland
        nicotine-plus
        kdenlive
        transmission-qt
#       transmission
        obs-studio
        qt5ct
        distrobox
        (python312.withPackages (
          ps: with ps; [
            pygame
            virtualenv
          ]) 
      )
   ];
  sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
 };
#};


nixpkgs.config = {
  allowUnfree = true;
};

  imports = [
#   ./gtk.nix
#   ./qt.nix
    ./emacs.nix
    ./alacritty.nix
    ./sxhkd.nix
    ./bspwm.nix
 ];


}
