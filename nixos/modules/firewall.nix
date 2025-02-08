{ config, lib, pkgs, ... }:

{
  networking = {
    # Activation du pare-feu avec priorité élevée
    firewall = {
      enable = lib.mkForce true;

      # Ports autorisés en entrée (TCP)
      allowedTCPPorts = lib.mkForce [
         22000 # Sync
         2002  # SSH
       # 80    # HTTP (si nécessaire)
       # 443   # HTTPS (si nécessaire)
      ];

      # Ports autorisés en entrée (UDP)
      allowedUDPPorts = lib.mkDefault [
        53 
        22000 #Sync
        21027 #Sync
      ];

      # Journalisation
      logRefusedConnections = lib.mkForce true;
      logRefusedPackets = lib.mkForce true;
    };

    # Protection contre les attaques communes
    nat = {
      enable = lib.mkDefault true;
      # Configuration anti-spoofing
      externalIP = lib.mkDefault " 88.185.164.142"; # Ajoutez votre IP externe si nécessaire
    };
  };

  # Configuration fail2ban avec priorité élevée
  services.fail2ban = {
    enable = lib.mkForce true;
  # Ajouter ces lignes à votre configuration
  extraPackages = [ pkgs.fail2ban ];

  # Configuration des jails
    jails = {
      # Protection SSH standard
      sshd = lib.mkForce ''
        enabled = true
        port = ssh
        filter = sshd
        logpath = /var/log/auth.log
        maxretry = 3
        findtime = 600
        bantime = 3600
      '';

      # Protection SSH plus stricte (utilise le même filtre mais avec des paramètres plus stricts)
      sshd-strict = lib.mkForce ''
        enabled = true
        port = ssh
        filter = sshd
        logpath = /var/log/auth.log
        maxretry = 1
        findtime = 600
        bantime = 7200
      '';    
    };
  };

  # Activation de la journalisation système
  services = {
    # Activation de syslogd pour les logs
    syslogd.enable = lib.mkForce true;

    # Configuration de journald
    journald.extraConfig = lib.mkDefault ''
      SystemMaxUse=2G
      MaxFileSec=7day
    '';
  };
}
