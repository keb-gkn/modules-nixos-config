# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
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

  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    x11.enable = true;
    gtk.enable = true;
    size = 32;
  };

  # Add programs
  home.packages = with pkgs; [
    # terminals
    termite
    alacritty

    # web browser
    firefox

    # shells
    fish

    # shell utils
    bat
    colordiff
    unstable.neofetch
    unstable.eza

    # fonts
    nerdfonts

    # utils
    xclip
    xdg-utils
    wget
    curl
    dex

    # build tools
    gnumake
    libclang
    libgcc
    gdb
    gdbm
    cgdb
    scons
    cmakeWithGui
    cmake-format

    # game dev
    unstable.godot_4

    # editor
    neovide
    inputs.neovim-flake.packages.x86_64-linux.maximal

    # icons
    papirus-nord

    # cursors
    nordzy-cursor-theme

    # gnome bs
    gnome.gnome-settings-daemon
    gsettings-desktop-schemas
    gnome.dconf-editor
    gnome.zenity

    # file explorer
    gnome.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    gnome.sushi

    # ssh
    gnome.gnome-keyring
    gnome.libgnome-keyring
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
    "/home/arthank/.config/fish" = {
      source = ./fish;
      recursive = true;
    };
    "/home/arthank/.face" = {
      source = ./assets/user-icon.png;
    };
    "/home/arthank/.config/awesome/src/assets/userpfp/arthank.png" = {
      source = ./assets/user-icon.png;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
