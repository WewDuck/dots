{ pkgs, ... }:
{

# Shell configs
  users.defaultUserShell = pkgs.fish;

  # Fish shell
  programs.fish = {
    enable=true;
    shellAliases ={
      l = "ls -Alh";
      ls = "ls --color=auto";
      nf = "neofetch";
     };
    };

  environment.systemPackages = with pkgs; [
    nushell
    sqlite
  ];

}
