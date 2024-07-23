{ pkgs, ... }:
{
home.packages = with pkgs; [
      (python312.withPackages (
        ps: with ps; [
          pygame
          virtualenv
        ]) 
      )
      godot_4
      nodePackages_latest.bash-language-server
      kate
  ];

  programs.tmux = {
      enable = true;
      extraConfig = "
        set-window-option -g mode-keys vi
      ";
  };

}

