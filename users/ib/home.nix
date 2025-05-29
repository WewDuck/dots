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
        floorp
        chromium
        telegram-desktop
        neofetch
        hyfetch
        cava
        cbonsai
        cmatrix
        lavat
        ookla-speedtest
        cfspeedtest
        pfetch
        nil
        kdePackages.kcolorchooser
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
	wofi
        nicotine-plus
        kdenlive
        transmission_4-qt
        obs-studio
        swaybg
 #       ncmpcpp
   ];
#  sessionVariables = {
#    QT_QPA_PLATFORMTHEME = "qt5ct";
#  };
# };


};

#  services.mpd = {
#    enable = true;

#  };


nixpkgs.config = {
  allowUnfree = true;
};

  imports = [
#  ./gtk.nix
#   ./qt.nix
    ./emacs.nix
    ./alacritty/alacritty.nix
    ./alacritty/ayu_dark.nix
#    ./sxhkd.nix
#    ./bspwm.nix
#    ./hyprland.nix
    ./dev.nix
 ];


}
