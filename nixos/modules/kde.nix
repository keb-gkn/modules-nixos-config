{ lib, config, pkgs, ... }:

{

  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  documentation.nixos.enable = false;

  # Packages système
  programs.kdeconnect = {
    enable = true;
  };
}
