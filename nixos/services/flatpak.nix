{ config, pkgs, ... }:

let
  grep = pkgs.gnugrep;

  # 1. Déclarez les Flatpaks que vous *souhaitez* sur votre système
  desiredFlatpaks = [
   "org.dupot.easyflatpak"
  ];
in
{
  # Active les flatpak
  services.flatpak.enable = true;

  system.activationScripts.flatpakManagement = {
    text = ''
      # 2. Dépôt Flathub
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo

      # 3. Obtenez les Flatpaks actuellement installés
      installedFlatpaks=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

      # 4. Supprimez les Flatpaks qui ne sont PAS dans la liste souhaitée
      #for installed in $installedFlatpaks; do
       # if ! echo ${toString desiredFlatpaks} | ${grep}/bin/grep -q $installed; then
        #  echo "Suppression de $installed car il n'est pas dans la liste desiredFlatpaks."
         # ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive $installed
        #fi
      #done

      # 5. Installez ou réinstallez les Flatpaks que vous VOULEZ
      for app in ${toString desiredFlatpaks}; do
        echo "S'assurer que $app est installé."
        ${pkgs.flatpak}/bin/flatpak install -y flathub $app
      done

      # 6. Mettez à jour tous les Flatpaks installés
      ${pkgs.flatpak}/bin/flatpak update -y
    '';
  };
}
