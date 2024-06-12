{ config, lib, pkgs, inputs, username, ... }:

{
  
  
users.users.ib = {
   isNormalUser = true;
   extraGroups = [ "wheel" "libvirt" ];
   packages = with pkgs; [

   ];
 };

qt.style = "breeze";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # Networking 
  networking.networkmanager.enable = true; 
   


  # Fonts
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraMono" "RobotoMono" "SourceCodePro" "Meslo" ]; })
 ];

  # Enable QMK
  hardware.keyboard.qmk.enable = true;


    # Generic packages I want regardless of machine or user
   environment.systemPackages = with pkgs; [
     neovim 
     git
     htop
     btop
     jdk8
     jdk17
     mlt
     procps
     python3
     gcc
     ripgrep
     fd
     lazygit
     unzip
     tree
     wget
     gh
     rar
     p7zip
     go
     stow
     inputs.home-manager.packages.${pkgs.system}.home-manager
   ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
#    pinentryPackage = lib.mkForce pkgs.pinentry-qt;
   };

}
