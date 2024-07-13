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
    ./programs
    ./style
    ./hypr
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
      EDITOR = "neovim";
    };
  };

  # Add programs
  home.packages = with pkgs; [
    # terminals
    termite
    alacritty

    # web browser
    firefox

    # apps
    vesktop

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
    dconf
    xdg-utils
    wget
    curl
    dex
    vulkan-tools
    wine
    gnome.eog
    fontconfig
    xorg.libX11
    freetype

    # documents
    pdfslicer
    zathura
    libreoffice

    # audio / pulse
    noisetorch
    pavucontrol

    # vlc
    vlc
    libmicrodns

    # muzak
    lmms

    # gaming
    lutris

    # dev tools
    gnumake
    libclang
    ccls
    libgcc
    gdb
    gdbm
    cgdb
    scons
    cmakeWithGui
    cmake-format

    # game dev
    unstable.godot_4
    blender

    # cad
    openscad

    # editor
    inputs.neovim-flake.packages.x86_64-linux.maximal

    # icons
    papirus-nord

    # cursors
    nordzy-cursor-theme

    # gnome bs
    gnome.gnome-settings-daemon
    gsettings-desktop-schemas
    gnome.zenity

    # file explorer
    gnome.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    gnome.sushi

    # ssh
    gnome.gnome-keyring
    gnome.libgnome-keyring

    #################### apps
    # graphics
    gimp-with-plugins
    gimpPlugins.gap
    gimpPlugins.fourier
    gimpPlugins.texturize
    inkscape
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
