{...}:
{

xsession.windowManager.bspwm = {
    enable = true;
    extraConfigEarly = " pgrep -x sxhkd > /dev/null || sxhkd &
    ";
  monitors = {
      DP-1 = [
        "1"
        "2"
        "3"
        "4"
      ];
    };
    settings = {
        border_width = 2;
        window_gap = 10;
      };
  };

}
