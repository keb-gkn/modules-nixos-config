{config, ...}: {
  programs.rofi = {
    enable = true;
    theme = "${config.home.homeDirectory}/.local/share/rofi/themes/nord-round.rasi";
  };
  home.file = {
    "${config.home.homeDirectory}/.local/share/rofi/themes/nord-full.rasi" = {
      source = ./nord-full.rasi;
      recursive = true;
    };
    "${config.home.homeDirectory}/.local/share/rofi/themes/nord-round.rasi" = {
      source = ./nord-round.rasi;
      recursive = true;
    };
  };
}
