{
  imports = [
    # base config with pkgs and services
    ./base.nix

    # modules
    ./modules/pulseaudio.nix
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix

    # hardware
    ./ASIMOV/hardware-configuration.nix
    ./hardware/nvidia.nix

    # graphics
    ./graphics/awesomewm.nix

    # programs
    ./programs/transmission.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
