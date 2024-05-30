{ lib, pkgs, ... }:
{

programs = {
  sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
    package = pkgs.swayfx;
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
