{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./qt.nix
  ];

  fonts.fontconfig.enable = true;

    file = {
      "${config.home.homeDirectory}/.face" = {
        source = ../assets/user-icon.png;
      };
      "${config.home.homeDirectory}/.wallpapers" = {
        source = ../assets/wallpapers;
        recursive = true;
      };
    };
  };
}
