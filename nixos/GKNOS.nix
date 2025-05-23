{
  imports = [
    # base config with pkgs and services
    ./modules/configuration.nix
    ./users/GKN.nix

    # modules
    ./modules/pipewire.nix
    ./modules/bluetooth.nix
    ./modules/printing.nix
    ./modules/gaming.nix
    ./modules/virtualization.nix
    ./modules/networking.nix 
    ./modules/ssh.nix
    ./modules/printing.nix
    ./modules/firewall.nix 
    ./modules/firefox.nix
    ./modules/packages.nix
    ./modules/system.nix
    ./modules/kde.nix
    ./modules/boot.nix
    ./modules/fstrim.nix
    ./modules/vscode.nix

    # hardware
    ./hardware/hardware-configuration.nix
    

    # services
    ./services/flatpak.nix
  ];

  # networking.hostName = "kebOS";
}
