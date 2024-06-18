{ pkgs, ... }:
{

programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
          lines = 30;
          columns = 110;
        };
      window.padding = {
            x = 12;
            y = 8;
        };
     
      font = {
        size = 11.0;
      normal = {
        family = "MesloLGS Nerd Font Mono";
        style = "Regular";
        };
      bold = {
        family = "MesloLGS Nerd Font Mono";
        style = "Bold";
        };  
      };
    };
  };
}
