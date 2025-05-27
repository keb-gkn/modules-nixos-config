{ lib, config, pkgs, ... }:

{

  # Enable the KDE Plasma Desktop Environment.
  services = {
   #displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

   documentation.nixos.enable = false;

   # Kdeconnect
   programs.kdeconnect.enable = true;

   environment.systemPackages = with pkgs; [
    catppuccin-kde
  ];

     environment = {
      plasma6.excludePackages = [ pkgs.kdePackages.discover ];
      systemPackages = [
        (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
          [General]
          background=/home/gkn/.dotfiles/nixos/assets/wallpapers/ghost_in_the_shell.jpg
        '')
       ];
    };
 }
