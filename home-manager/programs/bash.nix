{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      norse = "sudo nixos-rebuild switch --flake /home/gkn/.dotfiles/nixos#gknos";
      horse = "home-manager switch --flake /home/gkn/.dotfiles/nixos#gkn@gknos";
    };
  };
}
