{ ... }:
{

programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
          lines = 30;
          columns = 110;
        };
      window.padding = {
            x = 6;
            y = 6;
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

      cursor = {
        style = "Beam";
      };

    };
  };
}
