{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      norse = "sudo nixos-rebuild switch --flake /home/gkn/.dotfiles";
      horse = "home-manager switch --flake /home/gkn/.dotfiles";
    };
  };
}
