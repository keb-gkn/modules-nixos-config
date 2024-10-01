{pkgs, ...}: {
  home.packages = with pkgs; [
    # cmd
    bat
    colordiff
    unstable.neofetch
    unstable.eza

    # url
    wget
    curl

    # resource management
    htop

    # archiving and compression
    unzip

    # networking
    bluetuith

    # torrents
    stig

    # fonts
    fontconfig
    freetype

    # windows compatibility layer
    wine
  ];
}
