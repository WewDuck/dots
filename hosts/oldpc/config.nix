{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

   networking.hostName = "oldpc"; 
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

   time.timeZone = "Europe/Amsterdam";

   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     keyMap = "us";
   };

   users.users = {
   server = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
     ];
   };
   JamesBond = {
	isNormalUser = true;
	extraGroups = [ "sambaers" ];
   };
};
    users.groups = {
	sambaers = { };
    };

   environment.systemPackages = with pkgs; [
     neovim
     wget
     curl
     tree
#    jdk17_headless
#    jdk8_headless
     git
     fastfetch
     htop
     btop
     screen
     unzip
     cfspeedtest
     ookla-speedtest
     gcc
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
   networking.firewall.allowPing = true;

  system.stateVersion = "23.11";

}

