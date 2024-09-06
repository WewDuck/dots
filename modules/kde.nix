{ pkgs, ... }:
{

  # Enable the KDE Plasma Desktop.
  services.desktopManager.plasma6.enable = true;

  services.xserver.displayManager.gdm.enable = true;

# environment.plasma5.excludePackages = with pkgs.libsForQt5; [
#khelpcenter
# ];

}
