{ pkgs, ... }:
{

gtk = {
  enable = true;
  iconTheme = {
    name = "Tela-Purple-Dark"
    package = pkgs.tela-icon-theme;
  };
  theme = {
    name = "Catppuccin-Mocha-Standard-Lavender-Dark";
    package = pkgs.catppuccin-gtk.override { variant="mocha"; };
  };
};

gtk3.extraConfig = {
  Settings = ''
      gtk-application-prefer-dark-theme=1
          '';
  };
gtk4.extraConfig = {
  Settings = ''
      gtk-application-prefer-dark-theme=1
              '';
  };

}
