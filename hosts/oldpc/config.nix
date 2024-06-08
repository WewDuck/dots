{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "oldpc"; # Define your hostname.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

   time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
#    useXkbConfig = true; # use xkb.options in tty.
   };

   users.users = {
   server = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
     ];
   };
  };

   environment.systemPackages = with pkgs; [
     neovim
     wget
     curl
     tree
     jdk17_headless
     jdk8_headless
     git
     fastfetch
     htop
     btop
     screen
     unzip
   ];
	
   services.gitea = {
	enable = true;
   };

   services.cockpit = {
	enable = true;
	openFirewall = true;
   };

   services.openssh = {
	enable = true;
	settings = {
	  UseDns = true;
	  PermitRootLogin = "no";
	  PasswordAuthentication = false;
      };
      ports = [ 1337 ];
   }; 

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 25565 25556 1337 9090 ];
   networking.firewall.allowedUDPPorts = [ 25565 25556 ];

  system.stateVersion = "23.11";

}

