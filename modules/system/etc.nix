{ config, lib, pkgs, inputs, username, ... }:

{
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # Networking 
  networking.networkmanager.enable = true; 
   
  programs.nh = {
    enable = true;
    flake = "/home/ib/dots";
  };


  # Fonts
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraMono" "RobotoMono" "SourceCodePro" "Meslo" ]; })
 ];

  # Enable QMK
  hardware.keyboard.qmk.enable = true;

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


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
     pinentryPackage = lib.mkForce pkgs.pinentry-qt;
   };

}

