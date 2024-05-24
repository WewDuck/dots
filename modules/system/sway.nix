{ lib, pkgs, ... }:
{

programs = {

  sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
  };

  waybar = {
    enable = true;
  };

};

}
