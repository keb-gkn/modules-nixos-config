{
  imports = [
    ./gnome-keyring.nix
    ./flameshot.nix
    ./clipmenu.nix
    ./flatpak.nix
  ];

  # Nicely reload system units when changing configs
  systemd.user = {
    enable = true;
    startServices = "sd-switch";
  };
}
