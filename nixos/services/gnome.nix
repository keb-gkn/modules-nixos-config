{pkgs, ...}: {
  serives.gnome = {
    gnome-settings-daemon.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gnome.gnome-control-center
  ];
}
