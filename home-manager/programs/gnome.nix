{pkgs, ...}: {
  home.packages = with pkgs; [
    # gsettings
    gsettings-desktop-schemas

    # gnome-notify
    gnome.zenity

    # networking
    networkmanagerapplet
    gnome.gnome-nettool

    # bluetooth
    blueberry

    # file explorer
    gnome.nautilus
    gnome.nautilus-python
    gnome.sushi
    nautilus-open-any-terminal

    # keyring
    gnome.gnome-keyring
    gnome.libgnome-keyring

    # image viewer
    gnome.eog
  ];
}
