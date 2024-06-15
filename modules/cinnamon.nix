{ pkgs, lib, ... }:
{
services = {
    xserver = {
    desktopManager.cinnamon.enable = true;
    displayManager.defaultSession = "cinnamon";
  };
    cinnamon.apps.enable = true;
  };
}
