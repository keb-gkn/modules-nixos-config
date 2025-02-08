{
  imports = [
    # base config with pkgs and services
    ./modules/base.nix
    ./users/arthank.nix

    # modules
    ./modules/pipewire.nix
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix
    ./modules/appimage.nix
    ./modules/alsa.nix
    ./modules/hotspot.nix

    # hardware
    ./hardware/machines/ASIMOV.nix

    # services
    ./services/flatpak.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
