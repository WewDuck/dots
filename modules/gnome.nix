{ ... }:
{

services.xserver.desktopManager.gnome = {
    enable = true;
  };
services.gnome.games.enable = false;
programs.gnome-terminal.enable = true;
}
