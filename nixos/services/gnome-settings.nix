{
  services.gnome = {
    gnome-settings-daemon.enable = true;
  };

  programs.dconf = {
    enable = true;
  };
}
