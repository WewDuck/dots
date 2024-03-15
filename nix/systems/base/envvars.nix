{ config, pkgs, ... }:
{
  # Declare Session Variables
  environment.sessionVariables = {
  #NIXOS_OZONE_WL = "1";
  #WLR_NO_HARDWARE_CURSORS = "1";
  #MOZ_ENABLE_WAYLAND = "1";
 };

 # Declare Environment Variables
 environment.variables = {
    TERM = "xterm-256color";    
 };
}

