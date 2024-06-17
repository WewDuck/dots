{ pkgs, ... }:
{
programs.emacs = {
    enable = true;
    extraPackages = "epkgs: [ epkgs.evil epkgs.catppuccin-theme ]";
    extraConfig = ''
      (require 'evil)
      (evil-mode 1)
      (load-theme 'catppuccin :no-confirm)
    '';
  };
}
