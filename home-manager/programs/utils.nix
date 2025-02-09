{pkgs, ...}: {
  home.packages = with pkgs; [
    # cmd
    bat
    colordiff

    # url
    wget
    curl

    # resource management
    htop
    btop

    # fonts
    fontconfig
    freetype

    # glx
    glxinfo
    gpu-viewer
  ];
}
