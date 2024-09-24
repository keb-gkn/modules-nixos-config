{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      nosrs = "sudo nixos-rebuild switch --flake /etc/nixos#AWESIMOV";
      hmrs = "home-manager switch --flake /etc/nixos#arthank@AWESIMOV";
    };
    undistractMe = {
      enable = true;
      playSound = false;
      timeout = 60;
    };
  };
}
