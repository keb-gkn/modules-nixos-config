{ lib, config, pkgs, ... }:

{
   
  # services.xserver.enable = true;
  
  # Activation de KDE
  services = {
    desktopManager.plasma6.enable = lib.mkDefault true;

    # SDDM
    displayManager = {
      sddm = {
        enable = true; # This line is necessary to enable SDDM
        theme = "nord";
      };
    };  
  };  

  # Required for SDDM
  qt.style = "breeze";

  security = {
    polkit = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        model = "pc104";
        variant = "oss";
        options = "lv3:ralt_switch, compose:sclk, grp:menu_switch";
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "nord";
      };
    };

  documentation.nixos.enable = false;

  # Packages système
  programs.kdeconnect = {
    enable = true;
  };
}
