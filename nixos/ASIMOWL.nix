{
  imports = [
    # base config with pkgs and services
    ./base.nix

    # modules
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix

    # hardware
    ./hardware/machines/ASIMOV.nix
    ./hardware/nvidia.nix

    # graphics
    ./graphics/hyprland.nix

    # programs
    ./programs/transmission.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
