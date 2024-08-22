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


# services.xserver.displayManager = {
#    lightdm.enable = true;
#      session = [
#         {
#            manage = "desktop";
#            start = "bspwm";
#         }
#      ];
#     startx.enable = true;
#   };
#Services.xserver.displayManager = {

#lightdm = {
#   enable = true;
#   greeters.slick.enable = true;
#   };

#setupCommands = "export WLR_NO_HARDWARE_CURSORS=1";
#};


}
