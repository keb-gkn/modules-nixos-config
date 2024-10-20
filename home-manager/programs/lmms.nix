{pkgs, ...}: {
  home.file."/home/arthank/.appimages/.dummy" = {
    text = "dummy";
    recursive = true;
    onChange = ''
      if test -f "/home/arthank/.appimages/lmms-1.2.2.AppImage"; then
        echo "LMMS already downloaded"
      else
        ${pkgs.curl}/bin/curl -o /home/arthank/.appimages/lmms-1.2.2.AppImage https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
        chmod +x /home/arthank/.appimages/lmms-1.2.2.AppImage
      fi
      if test -f "/home/arthank/.local/share/applications/lmms.desktop"; then
        cp /etc/nixos/home-manager/lmms/lmms.desktop /home/arthank/.local/share/applications/lmms.desktop
        chmod +x /home/arthank/.local/share/applications/lmms.desktop
      fi
    '';
  };
}
