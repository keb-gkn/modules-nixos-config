{pkgs, ...}: {
  home.packages = with pkgs; [
    dex
    mimeo
  ];
}
