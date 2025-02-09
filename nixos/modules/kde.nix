{ lib, config, pkgs, ... }:

{

   # Activation de KDE
  services = {
    displayManager.sddm.enable = lib.mkDefault true;
    desktopManager.plasma6.enable = lib.mkDefault true;
  };

  documentation.nixos.enable = false;

  # Packages système
  programs.kdeconnect = {
    enable = true;
  };
}
