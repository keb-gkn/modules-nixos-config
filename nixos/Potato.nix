{
  imports = [
    # base config with pkgs and services
    ./base.nix

    # Hardware configuration (nixos-generate-config)
    ./Potato/hardware-configuration.nix
  ];
}
