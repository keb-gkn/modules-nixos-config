args@{ config, lib, pkgs, ... }:

let
    cfg = config.sddmAstronautTheme or {};
    sddm-astronaut-theme = import ./derivation.nix (args // {
        theme = cfg.subtheme;
        themeOverrides = cfg.themeOverrides;
    });
in {
    options.sddmAstronautTheme = {
        enable = lib.mkEnableOption "sddm astronaut theme";
        subtheme = lib.mkOption {
            type = lib.types.str;
            default = "astronaut";
            description = "Which subtheme of the sddm astronaut theme to use.";
        };
        themeOverrides = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            default = {};
            description = "Overrides for options specified in the selected theme.conf.";
        };
    };

    config = lib.mkIf cfg.enable {
        # Apply the configuration value to the derivation
        environment.systemPackages = [
            sddm-astronaut-theme
        ];

        services.displayManager.sddm.extraPackages = with pkgs.kdePackages; [
            qtsvg
            qtmultimedia
            qtvirtualkeyboard
        ];
    };
}
