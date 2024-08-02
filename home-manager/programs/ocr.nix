{pkgs, ...}: {
  home.file = {
    ".local/bin/ocr" = {
      source = "${pkgs.writeScript "ocr" ''
        #!/usr/bin/env bash
        ${pkgs.xfce.xfce4-screenshooter}/bin/xfce4-screenshooter -r --save /tmp/ocr-tmp.png
        ${pkgs.tesseract}/bin/tesseract /tmp/ocr-tmp.png /tmp/ocr-out
        cat /tmp/ocr-out.txt | ${pkgs.xclip}/bin/xclip -sel clip
        rm /tmp/ocr-tmp.png
      ''}";
    };
  };
  xdg.desktopEntries.ocr = {
    name = "OCR image";
    exec = "~/.local/bin/ocr";
    executable = true;
  };
}
