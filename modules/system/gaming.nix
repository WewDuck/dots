{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };

  # Enable OpenGL
   hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Vaapi
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

  # Gamer packages

  environment = {
    systemPackages = with pkgs; [
      prismlauncher
      osu-lazer
      wineWowPackages.staging
      gzdoom
#     nxengine-evo
      mangohud
    ];
  };
}
