{
  pkgs,
  inputs,
  ...
}: {
  imports = [
   # vide
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  # Add programs
  home.packages = with pkgs; [
    #vide
  ];
}
