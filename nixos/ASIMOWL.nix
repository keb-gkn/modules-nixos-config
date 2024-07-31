{
  imports = [
    # base config with pkgs and services
    ./base.nix

    ./bluetooth.nix
    ./cups.nix

    ./gaming.nix

    ./graphics/hyprland.nix

    # nvidia
    ./graphics/nvidia.nix

    # Hardware configuration (nixos-generate-config)
    ./ASIMOV/hardware-configuration.nix
  ];

  networking.hostName = "ASIMOV";
}
