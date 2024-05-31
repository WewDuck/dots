{ config, pkgs, ... }:
{
  # Declare Session Variables
 environment.sessionVariables = {
  EDITOR = "neovim";
  WLR_NO_HARDWARE_CURSORS = "1";
  QT_QPA_PLATFORMTHEME = "qt5ct";
# WLR_RENDERER = "vulkan";
};

 # Declare Environment Variables
 environment.variables = {
   EDITOR = "neovim";
   TERM = "xterm-256color";
   WLR_NO_HARDWARE_CURSORS = "1";
   QT_QPA_PLATFORMTHEME = "qt5ct";
#  WLR_RENDERER = "vulkan";
 };
}

