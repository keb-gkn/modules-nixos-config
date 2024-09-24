{pkgs, ...}: {
  home.packages = with pkgs; [
    # icons
    papirus-nord

    # cursors
    nordzy-cursor-theme
  ];
}
