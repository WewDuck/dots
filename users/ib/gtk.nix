{ pkgs, inputs, ... }:
{
imports = [inputs.catppuccin.homeManagerModules.catppuccin];

gtk = {
  enable = true;
  iconTheme = {
    name = "Tela-Purple-Dark";
    package = pkgs.tela-icon-theme;
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    size = "standard";
    tweaks = ["normal"];
  };
#  theme = {
#    name = "Catppuccin-Mocha-Standard-Lavender-Dark";
#    package = pkgs.catppuccin-gtk.override { variant="mocha"; };
# };

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

};


}
