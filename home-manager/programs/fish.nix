{
  programs.fish = {
    enable = true;
  };

  home.file."/home/arthank/.config/fish" = {
    source = ../fish;
    recursive = true;
  };
}
