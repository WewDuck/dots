{...}:
{

services.sxhkd = {
    enable = true;

    keyBindings = {
      
    # generic

      "super + q" = "alacritty";

      "super + d" = "rofi -show drun";

      "super + ctrl + r" = "pkill -USR1 -x sxhkd";

    # bspwm
      
      # quit/restart wm
      "super + shift + {q,r}" = "bspc {quit,wm -r}";

      # close/kill
      "super + {_,shift +}w" = "bspc node -{c,k}";
      
      # monocle
      "super + f" = "bscp desktop -l next";

      # send newest marked node to the newest preselected node
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      # set window state
      "super + {t,shift + m,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      # focus node in given direction 
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      # focus the node for the given path jump
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";

      # focus the next/previous window in the current desktop
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local.!hidden.window";

      # focus the next/previous desktop in the current monitor
      "super + ctrl + {h,l}" = "bspc desktop -f {prev,next}.local";

      # focus the last node/desktop
      "super + {grave,Tab}" = "bspc {node,desktop -f last}";

      # focus the older or newer node in the focus history
      "super + {o,i}" = "
        bspc wm -h off; \
        bspc node {older,newer} -f; \
        bspc wm -h on
      ";

      # focus or send to the given desktop
      "super + {_,shift +}{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      # preselect ratio
      "super + alt + {1-9}" = "bspc node -o 0.{1-9}";

      # preselect direction
      "super + alt + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

      # cancel the preselection for the focused desktop
      "super + alt + z" = "bspc node -p cancel";

      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      # expand a window by moving one of it's sides outward
      "super + alt + shift + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

      # expand a window by moving one of it's sides inward
      "super + alt + ctrl + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";

      # move a floating window
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

    };

  };

}

