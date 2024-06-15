 { pkgs, ... }:
{
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        style.package = pkgs.catppuccin-qt5ct;
    };
}
