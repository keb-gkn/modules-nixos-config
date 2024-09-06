{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./fish.nix
    ./ocr.nix
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # ~/.nix-profile/share/applications/mimeinfo.cache has a much more complete list
        # no need for an exhaustive list here, just some basics
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop" "com.github.junrrein.PDFSlicer.desktop"];
        "application/octet-stream" = "nvim.desktop";
        "image/*" = ["org.gnome.eog.desktop" "gimp.desktop"];
        "image/svg+xml-compressed" = ["org.gnome.eog.desktop" "org.inkscape.Inkscape.desktop" "gimp.desktop"];
        "audio/*" = ["vlc.desktop"];
        "video/*" = ["vlc.desktop"];
      };
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
    discord

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
    htop
    vulkan-tools
    wine
    gnome.eog
    fontconfig
    xorg.libX11
    freetype
    wev
    bluetuith
    mimeo
    unzip
    unstable.stig

    # documents
    pdfslicer
    zathura
    libreoffice
    texliveFull
    texmaker

    # audio / pulse
    noisetorch
    pavucontrol

    # vlc
    vlc
    libmicrodns

    # other media players
    mpv
    cmus

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
    gsettings-desktop-schemas
    gnome.zenity

    # gnome-bluetooth
    blueberry

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
}
