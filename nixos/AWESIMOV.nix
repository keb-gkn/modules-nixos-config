{
  imports = [
    # base config with pkgs and services
    ./modules/base.nix
    ./users/arthank.nix

    # modules
    ./modules/pulseaudio.nix
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix
    ./modules/appimage.nix
    ./modules/alsa.nix

    # hardware
    ./hardware/machines/ASIMOV.nix
    ./hardware/nvidia.nix

    # graphics
    ./graphics/awesomewm.nix

    # services
    ./services/flatpak.nix
    ./services/transmission.nix
    ./services/ratbagd.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
