{ config, pkgs, ... }:
{
  # Declare Session Variables
# environment.sessionVariables = {
#  TERM = "xterm-256color";
#   EDITOR = "neovim";
};

 # Declare Environment Variables
 environment.variables = {
   EDITOR = "neovim";
   WLR_NO_HARDWARE_CURSORS = "1";
 };
}

