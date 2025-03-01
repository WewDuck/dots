{ pkgs, ... }:
{
# Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = false;
}
