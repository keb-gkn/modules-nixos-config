{
  imports = [
    # base config and user
    ./modules/base.nix
    ./users/cheeselover.nix

    # modules
    ./modules/pulseaudio.nix
    ./modules/gaming.nix

    # hardware
    ./hardware/machines/Potato.nix

    # graphics
    ./graphics/awesomewm.nix

    # services
    ./services/flatpak.nix
    ./services/transmission.nix
    ./services/gnome-settings.nix
  ];

  networking.hostName = "Potato";

  services.transmission.home = "/var/lib/transmission";
}
