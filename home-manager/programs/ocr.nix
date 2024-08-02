{pkgs, ...}: {
  xdg.desktopEntries.ocr = {
    name = "OCR image";
    exec = "${pkgs.writeScript "ocr" ''
      ${pkgs.xfce.xfce4-screenshooter}/bin/xfce4-screenshooter -r --save /tmp/ocr-tmp.png
      ${pkgs.tesseract}/bin/tesseract /tmp/ocr-tmp.png /tmp/ocr-out
      cat /tmp/ocr-out.txt | ${pkgs.xclip}/bin/xclip -sel clip
      rm /tmp/ocr-tmp.png
    ''}";
  };
}
