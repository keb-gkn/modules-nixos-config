{
  imports = [
    # base config with pkgs and services
    ./modules/base.nix
    ./users/arthank.nix

    # modules
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix

    # hardware
    ./hardware/machines/ASIMOV.nix
    ./hardware/nvidia.nix

    # graphics
    ./graphics/hyprland.nix

    # services
    ./services/flatpak.nix
    ./services/transmission.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
