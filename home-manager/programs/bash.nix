{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      norse = "sudo nixos-rebuild switch --flake /etc/nixos#kebOS";
      horse = "home-manager switch --flake /etc/nixos#kebzcool@kebOS";
    };
  };
}
