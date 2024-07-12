{
  imports = [
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./fish.nix
  ];

  programs.home-manager.enable = true;
}
