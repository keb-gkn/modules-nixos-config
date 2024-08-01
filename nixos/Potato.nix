{
  imports = [
    # base config with pkgs and services
    ./base.nix

    # modules
    ./modules/pulseaudio.nix
    ./modules/gaming.nix

    # hardware
    ./hardware/machines/Potato.nix

    # graphics
    ./graphics/awesomewm.nix
  ];

  networking.hostName = "Potato";

  services.transmission.home = "/var/lib/transmission";
}
