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
      # Enhancer for YouTube
      "jid1-ZAdIEUB7XOzOJw@jetpack" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4393561/enhancer_for_youtube-2.0.130.1.xpi";
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
      
      # Pure URL
      "pure-url@jetpack" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4270514/pure_url-1.3.1resigned1.xpi";
        installation_mode = "force_installed";
      };
      
      # ProtonPass
      "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4433286/proton_pass-1.29.2.xpi";
        installation_mode = "force_installed";
      };
    };
  };
};

}
