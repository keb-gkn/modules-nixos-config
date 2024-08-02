{
  imports = [
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./fish.nix
    ./ocr.nix
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # ~/.nix-profile/share/applications/mimeinfo.cache has a much more complete list
        # no need for an exhaustive list here, just some basics
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop" "com.github.junrrein.PDFSlicer.desktop"];
        "application/octet-stream" = "nvim.desktop";
        "image/*" = ["org.gnome.eog.desktop" "gimp.desktop"];
        "image/svg+xml-compressed" = ["org.gnome.eog.desktop" "org.inkscape.Inkscape.desktop" "gimp.desktop"];
        "audio/*" = ["vlc.desktop"];
        "video/*" = ["vlc.desktop"];
      };
    };
  };
}
