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

  environment.systemPackages = with pkgs; [
    grimblast
    qt5ct
    pavucontrol
  ];

}
