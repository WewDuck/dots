{ pkgs, ... }:

{

   # Generic desktop settings

   services.xserver = {
   enable = true;
   excludePackages = with pkgs; [
   xterm
   ];
};

   services.xserver.xkb.layout = "us";


  services.xserver.displayManager.gdm.enable = true;

}
