{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    #package = pkgs.librewolf; # Installation de librewolf possible
     # Support audio/vidéo via PipeWire
     wrapperConfig = {
       pipewireSupport = true;   
    };        

    # Configuration des langues
    languagePacks = [ "fr" "en-US" ];

     /* ---- PREFERENCES ---- */
    # Check about:config for options.
    preferences = {
      "intl.accept_languages" = "fr-fr,en-us,en";
      "intl.locale.requested" = "fr,en-US";     
     };

     /* ---- POLICIES ---- */
     # Check about:policies #documentation for options.
     # Politiques de sécurité et de confidentialité
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableDeveloperTools = false;
      DontCheckDefaultBrowser = true;

     /* ---- EXTENSIONS ---- */
     # Check about:support for extension/add-on ID strings.
     # Valid strings for installation_mode are "allowed", "blocked",
     # "force_installed" and "normal_installed"
     /* ---- POLICIES ---- */

    # Configuration des extensions
      ExtensionSettings = {

      # SponsorBlock
      "sponsorBlocker@ajay.app" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4501802/sponsorblock-5.12.4.xpi";
        installation_mode = "force_installed";
      };
      
      # uBlock Origin
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
      };
      
      # Bitwarden
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4410896/bitwarden_password_manager-2024.12.4.xpi";
        installation_mode = "force_installed";
      };
      
      # SimpleLogin
      "addon@simplelogin" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4332232/simplelogin-3.0.5.xpi";
        installation_mode = "force_installed";
      };
      
      # Firefox color
      "FirefoxColor@mozilla.com" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/3643624/firefox_color-2.1.7.xpi";
        installation_mode = "force_installed";
      };
    };
  };
};

}
