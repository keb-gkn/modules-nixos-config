# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # nix-colors
    inputs.nix-colors.homeManagerModules.default
    
    # My modules
    ./xresources-nord.nix
    ./neovim
  ];

  colorScheme = inputs.nix-colors.homeManagerModules.nord;

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "arthank";
    homeDirectory = "/home/arthank";
  };

  # Add programs
  home.packages = with pkgs; [
    termite
    bat
    colordiff
    xclip
    unstable.eza
    xdg-utils
    libclang
    libgcc
    gdb
    gdbm
    cgdb
    gdbui
    unstable.godot
    scons
    cmakeWithGui
    cmake-format
  ];

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
