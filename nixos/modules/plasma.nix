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

     environment = {
      plasma6.excludePackages = [ pkgs.kdePackages.discover ];
      systemPackages = [
        (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
          [General]
          background=/etc/wallpapers/glf/white.jpg
        '')
       ];
     };
   };
}
