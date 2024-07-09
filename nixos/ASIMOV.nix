{
  imports = [
    # base config with pkgs and services
    ./base.nix

    # nvidia
    ./graphics/nvidia.nix

    # Hardware configuration (nixos-generate-config)
    ./ASIMOV/hardware-configuration.nix
  ];
}
