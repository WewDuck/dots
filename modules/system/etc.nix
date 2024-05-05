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

  # Enable the KDE Plasma Desktop.
  services.desktopManager.plasma6.enable = true;
   services.xserver.displayManager = {
    gdm.enable = true;
    defaultSession = "plasmax11";
  };
  # services.xserver.displayManager.sddm.enable = true; 
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
	khelpcenter
  ];

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

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

    # Shell configs
  users.defaultUserShell = pkgs.fish;

  # Fish shell
  programs.fish = {
    enable=true;
    shellAliases ={
      l = "ls -Alh";
      ls = "ls --color=auto";
      nf = "neofetch";
     };
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

