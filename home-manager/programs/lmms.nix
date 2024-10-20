{
  pkgs,
  lib,
  config,
  ...
}: {
  home.activation.lmmsInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [[ -d "${config.home.homeDirectory}/.appimages/" ]]; then
      echo ".appimages dir exists"
    else
      if [[ -v DRY_RUN ]]; then
        echo "mkdir ${config.home.homeDirectory}/.appimages"
      else
        mkdir ${config.home.homeDirectory}/.appimages
      fi
    fi
    if [[ -f "${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage" ]]; then
      echo "LMMS already downloaded"
    else
      if [[ -v DRY_RUN ]]; then
        echo "${pkgs.curl}/bin/curl -o ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage http://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage"
        echo "chmod +x ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage"
      else
        ${pkgs.wget}/bin/wget -O ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage http://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
        chmod +x ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage
      fi
    fi
    if [[ -f "${config.home.homeDirectory}/.local/share/applications/lmms.desktop" ]]; then
      echo "LMMS desktop file already moved to share/applications"
    else
      if [[ -v DRY_RUN ]]; then
        echo "cp /etc/nixos/home-manager/lmms/lmms.desktop ${config.home.homeDirectory}/.local/share/applications/lmms.desktop"
        echo "chmod +x ${config.home.homeDirectory}/.local/share/applications/lmms.desktop"
      else
        cp /etc/nixos/home-manager/lmms/lmms.desktop ${config.home.homeDirectory}/.local/share/applications/lmms.desktop
        chmod +x ${config.home.homeDirectory}/.local/share/applications/lmms.desktop
      fi
    fi
  '';
}
