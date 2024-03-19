{ config, pkgs, ... }:
{
  # Declare Session Variables
  environment.sessionVariables = {
    TERM = "xterm-256color";
    EDITOR = "neovim";
 };

 # Declare Environment Variables
 environment.variables = {
    TERM = "xterm-256color";
    EDITOR = "neovim";
 };
}

