{
  imports = [
    # base config with pkgs and services
    ./base.nix

    ./pulseaudio.nix
    ./bluetooth.nix
    ./cups.nix

    ./gaming.nix

    ./graphics/awesomewm.nix

    # nvidia
    ./graphics/nvidia.nix

    # Hardware configuration (nixos-generate-config)
    ./ASIMOV/hardware-configuration.nix
  ];

  networking.hostName = "ASIMOV";
}
