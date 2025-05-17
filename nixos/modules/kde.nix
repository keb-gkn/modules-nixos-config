{ lib, config, pkgs, ... }:

{

  # Enable the KDE Plasma Desktop Environment.
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  documentation.nixos.enable = false;

  # Packages système
  programs.kdeconnect.enable = true;

  environment = {
    plasma6.excludePackages = [ pkgs.kdePackages.discover ];

  };
}
