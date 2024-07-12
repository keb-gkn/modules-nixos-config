{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "eza -alh";
      nors = "sudo nixos-rebuild switch --flake /etc/nixos#ASIMOV";
      hmrs = "home-manager switch --flake /etc/nixos#arthank@ASIMOV";
    };
    history = {
      size = 10000;
      path = "/home/arthank/.config/zsh/history";
    };
  };
}
