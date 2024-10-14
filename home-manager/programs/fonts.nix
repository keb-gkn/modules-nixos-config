{pkgs, ...}: {
  home.packages = with pkgs; [
    nerdfonts
    open-sans
  ];
}
