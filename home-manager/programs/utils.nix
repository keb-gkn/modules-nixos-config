{pkgs, ...}: {
  home.packages = with pkgs; [
    # cmd
    bat
    colordiff
    unstable.neofetch
    unstable.eza
    inxi

    # url
    wget
    curl

    # resource management
    htop
    btop

    # archiving and compression
    unzip

    # networking
    bluetuith

    # torrents

    # fonts
    fontconfig
    freetype

    # windows compatibility layer
    wine

    # glx
    glxinfo
    gpu-viewer
  ];
}
