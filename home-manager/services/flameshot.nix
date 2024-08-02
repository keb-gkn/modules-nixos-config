{config, ...}: {
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        uiColor = "#4c566a";
        contrastUiColor = "#5e81ac";
        drawColor = "#5e81ac";
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        savePathFixed = true;
        saveAsFileExtension = ".png";
        useJpgForClipboard = false;
        startupLaunch = true;
      };
    };
  };
}
