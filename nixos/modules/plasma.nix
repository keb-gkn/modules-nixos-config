{ lib, config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  documentation.nixos.enable = false;

  # Kdeconnect
  programs.kdeconnect.enable = true;

  # System packages and theme configuration
  environment.systemPackages = with pkgs; [
    catppuccin-kde
  # Configure SDDM theme with custom wallpaper
      #(pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
       # [General]
       # background=/home/gkn/.dotfiles/nixos/assets/wallpapers/ghost_in_the_shell.jpg
     # '')
    ];

  environment = {
    # Exclude discover package from Plasma 6
    plasma6.excludePackages = [ pkgs.kdePackages.discover ];
    
  };
}
