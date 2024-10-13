{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamemode = {
      enable = true;
    };
  };

  # Enable OpenGL
   hardware.graphics = {
    enable = true;
#   driSupport = true;
    enable32Bit = true;
  };

  # Vaapi
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

  # Gamer packages

  environment = {
    systemPackages = with pkgs; [
      prismlauncher
#     osu-lazer
      wineWowPackages.stagingFull
      gzdoom
      nxengine-evo
      mangohud
      oversteer
      protontricks
    ];
  };
}
