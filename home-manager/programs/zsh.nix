{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      nosrs = "sudo nixos-rebuild switch --flake /etc/nixos#AWESIMOV";
      hmrs = "home-manager switch --flake /etc/nixos#arthank@AWESIMOV";
    };
    history = {
      size = 10000;
      path = "/home/arthank/.config/zsh/history";
    };
  };
}
