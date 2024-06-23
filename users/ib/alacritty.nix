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
    colors = {
        # Catppuccin Mocha theme
       primary = {
         background = "#181825";
         foreground = "#cdd6f4";
       };
       cursor = {
         text = "#1e1e2e";
         cursor = "#f5e0dc";
       };
       vi_mode_cursor = {
         text = "#1e1e2e";
         cursor = "#b4befe"; };
       selection = {
         text = "#1e1e2e";
         background = "#f5e0dc";
       };
       normal = {
         black = "#45475a";
         red = "#f38ba8";
         green = "#a6e3a1";
         yellow = "#f9e2af";
         blue = "#89b4fa";
         magenta = "#f5c2e7";
         cyan = "#94e2d5";
         white = "#bac2de"; };
       bright = {
         black = "#585b70";
         red = "#f38ba8";
         green = "#a6e3a1";
         yellow = "#f9e2af";
         blue = "#89b4fa";
         magenta = "#f5c2e7";
         cyan = "#94e2d5";
         white = "#a6adc8";
       };
       dim = {
         black = "#45475a";
         red = "#f38ba8";
         green = "#a6e3a1";
         yellow = "#f9e2af";
         blue = "#89b4fa";
         magenta = "#f5c2e7";
         cyan = "#94e2d5";
         white = "#bac2de";
       };
    };
    };
  };
}
