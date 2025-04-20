{
  pkgs,
  config,
  ...
}: {
  imports = [
  
  ];

  fonts.fontconfig.enable = true;

    home.file = {
      "${config.home.homeDirectory}/.face" = {
        source = ../assets/user-icon.png;
      };
      "${config.home.homeDirectory}/.wallpapers" = {
        source = ../assets/wallpapers;
        recursive = true;
      };
    };
  }
