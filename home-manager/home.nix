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
    # My modules
  ];

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
    sessionVariables = {
      EDITOR = "neovide";
    };
  };

  fonts.fontconfig.enable = true;

  # Add programs
  home.packages = with pkgs; [
    termite
    bat
    colordiff
    nerdfonts
    unstable.neofetch
    xclip
    unstable.eza
    xdg-utils
    gnumake
    libclang
    libgcc
    gdb
    gdbm
    cgdb
    neovim
    unstable.godot_4
    scons
    cmakeWithGui
    cmake-format
    wget
    curl
    firefox
    neovide
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
  ];

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
      userEmail = "a.c.pufu@gmail.com";
      userName = "CloudyChris";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # AwesomeWM
  home.file = {
    "/home/arthank/.config/awesome" = {
      source = ./awesome;
      recursive = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
