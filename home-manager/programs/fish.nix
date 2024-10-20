{config, ...}: {
  programs.fish = {
    enable = true;
  };

  home.file."${config.home.homeDirectory}/.config/fish" = {
    source = ../fish;
    recursive = true;
  };
}
