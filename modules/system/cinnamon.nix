{ pkgs, lib, ... }:
{
services = {
    xserver.desktopManages.cinnamon.enable = true;
    cinnamon.apps.enable = true;
  };
}
