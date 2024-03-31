{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./hardware-configuration.nix
    ];
  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # Networking 
  networking.networkmanager.enable = true; 

  # Set your time zone.
   time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
   i18n.extraLocaleSettings = {
	LC_ADDRESS = "nl_NL.UTF-8";
	LC_IDENTIFICATION = "nl_NL.UTF-8";
	LC_MEASUREMENT = "nl_NL.UTF-8";
	LC_MONETARY = "nl_NL.UTF-8";
	LC_NAME = "nl_NL.UTF-8";
	LC_NUMERIC = "nl_NL.UTF-8";
	LC_PAPER = "nl_NL.UTF-8";
	LC_TELEPHONE = "nl_NL.UTF-8";
	LC_TIME = "en_GB.UTF-8";
  };
   

  # Fonts
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraMono" "RobotoMono" ]; })
 ];

  # Enable the X11 windowing system.
   services.xserver = {
   enable = true;
   excludePackages = with pkgs; [
   xterm
   ];
};

  # Declare Session Variables
  environment.sessionVariables = {
  #NIXOS_OZONE_WL = "1";
  #WLR_NO_HARDWARE_CURSORS = "1";
  #MOZ_ENABLE_WAYLAND = "1";
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

  # Enable OpenGL
   hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

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
      update = "cd /home/ib/dots && sudo nixos-rebuild switch --flake /home/ib/dots#desktop";
      upgrade = "cd /home/ib/dots && sudo nixos-rebuild switch --flake /home/ib/dots#desktop --upgrade && sudo nix-collect-garbage -d";
      clean = "sudo nix-collect-garbage -d";
      config = "nvim /home/ib/dots/nix/systems/desktop/configuration.nix";
      nf = "neofetch";
     };
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
     users.users.ib = {
       isNormalUser = true;
       extraGroups = [ "wheel" "libvirt" ]; # Enable ‘sudo’ for the user.
       packages = with pkgs; [
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

    # List packages installed in system profile. 
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

