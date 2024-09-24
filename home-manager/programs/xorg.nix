{pkgs, ...}: {
  home.packages = with pkgs; [
    # clipboard
    xclip

    # xdg
    xdg-utils

    # X11
    xorg.libX11
  ];
}
