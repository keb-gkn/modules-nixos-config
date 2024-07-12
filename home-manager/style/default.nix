{pkgs, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    x11.enable = true;
    gtk.enable = true;
    size = 32;
  };

  home.sessionVariables.GTK_THEME = "Nordic";

  home.file = {
    "/home/arthank/.face" = {
      source = ./assets/user-icon.png;
    };
    "/home/arthank/.wallpapers" = {
      source = ./assets/wallpapers;
      recursive = true;
    };
  };
}
