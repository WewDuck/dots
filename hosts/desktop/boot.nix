{ pkgs, ... }:
let
  grubTheme = pkgs.stdenv.mkDerivation {
    pname = "distro-grub-themes";
    version = "3.1";
    src = pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      rev = "v3.1";
      hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
    };
    installPhase = "cp -r customize/nixos $out";
  };
in
{
  boot.loader = { 
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub ={
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
      theme = grubTheme;
    };
  };

    # Set systemd timeout
systemd.extraConfig = "
  DefaultTimeoutStopSec=10s
  DefaultTimeoutStartSec=10s
";
  
  # Set Linux Kernel Version.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  swapDevices = [ {
    device = "/swapfile";
    size = 8*1024;

 } ];

}
