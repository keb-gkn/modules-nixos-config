{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    easyeffects
    noisetorch
  ];
}
