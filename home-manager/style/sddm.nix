{ config, pkgs, ... }

{

sddmAstronautTheme = {
        enable = true;
        subtheme = "astronaut";
        themeOverrides = {
            Background = "${../../common/wallpapers/escaping_the_well.jpg}";
            PartialBlur = "false";
            WarningColor = "#ffffff";
     };
  };
