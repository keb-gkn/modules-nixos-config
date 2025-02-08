
{ lib, config, pkgs, ... }:

{
  # Activation de KDE
  services = {
    desktopManager.plasma6.enable = lib.mkDefault true;
  };

  # Required for SDDM
  qt.style = "breeze";

  security = {
    polkit = {
      enable = true;
    };

  # SDDM
    displayManager = {
      sddm = {
        enable = true;
        theme = "nord";
      };
    };
  };
 
  documentation.nixos.enable = false;

  # Packages système
  programs.kdeconnect = {
    enable = true;
  };
}
