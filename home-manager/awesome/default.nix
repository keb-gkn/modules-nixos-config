{config, ...}: {
  home.file = {
    "${config.home.homeDirectory}/.config/awesome" = {
      source = ./config;
      recursive = true;
    };
    "${config.home.homeDirectory}/.config/awesome/src/assets/userpfp/arthank.png" = {
      source = ../assets/user-icon.png;
    };
  };
}
