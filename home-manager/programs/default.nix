{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bash.nix
    ./zsh.nix
    ./git.nix
    ./alacritty.nix
    ./utils.nix
    ./fonts.nix
    ./vscode.nix
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  # Add programs
  home.packages = with pkgs; [
   # dev
    blender

   # plugins gimp
    gimp-with-plugins
    gimpPlugins.fourier
    gimpPlugins.texturize

   # Storage photos
    ente-desktop
    # ente-auth
    
  ];
}
