{ config, lib, pkgs, inputs, ... }:

{
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # Networking 
  networking.networkmanager.enable = true; 
   
  # NH
  programs.nh = {
    enable = true;
    flake = "/home/ib/dots/";
  };

  # Fonts
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraMono" "RobotoMono" "SourceCodePro" "Meslo" ]; })
 ];

  # Enable the X11 windowing system.
   services.xserver = {
   enable = true;
   excludePackages = with pkgs; [
   xterm
   ];
};

  services.xserver.displayManager.gdm.enable = true;


  # Enable QMK
  hardware.keyboard.qmk.enable = true;


 # Configure keymap in X11
   services.xserver.xkb.layout = "us";

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound
   sound.enable = true;
   security.rtkit.enable = true;
   services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
  };

  hardware.pulseaudio.enable = false;

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


     users.users.ib = {
       isNormalUser = true;
       extraGroups = [ "wheel" "libvirt" ];
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
       ];
     };

    # Generic packages I want regardless of machine or user
   environment.systemPackages = with pkgs; [
     neovim 
     kitty
     krita
     git
     htop
     btop
     jdk8
     jdk17
     kdenlive
     mlt
     transmission-qt
     transmission
     obs-studio
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
     tigervnc
     rar
     nicotine-plus
     p7zip
     go
     stow
   ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?

}

