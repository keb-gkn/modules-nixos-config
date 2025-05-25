{ lib, config, pkgs, ... }:

{

 # sddm-astronaut-theme
    services.displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme"; # Must match package name
      # settings = {
      #   General = {
      #     HeaderText = "Hi";
      #     Background = "/etc/nixos/ressources/wallpapers/1359465.png";
      #   };
      # };
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
      ];
    };

  environment.systemPackages = with pkgs; [ #would be pkgs.packagename without the with pkgs;
      (pkgs.callPackage ../../../ressources/sddm-astronaut-theme {
        # theme = "hyprland_kath";
        # theme = "black_hole";
        # theme = "japanese_aesthetic";
          theme = "astronaut";
        # theme = "purple_leaves";
        # theme = "pixel_sakura(-static)";
        themeConfig = {
          General = {
            HeaderText = "Hi Bitch!";
            Background = "/home/gkn/.config/nixos/ressources/wallpapers/ghost_in_the_shell.jpg";
            FullBlur = "false";
           };   
        };
     })
  ];
  desktopManager.plasma6.enable = true;
  };

  documentation.nixos.enable = false;

  # Kdeconnect
  programs.kdeconnect.enable = true;

  environment = {
    plasma6.excludePackages = [ pkgs.kdePackages.discover ];
  };

}
