 { pkgs, ... }:
{
    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        style.package = pkgs.catppuccin;
    };
}
