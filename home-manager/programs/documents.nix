{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice
    zathura
    texliveFull
    texmaker
    pdfslicer
  ];
}
