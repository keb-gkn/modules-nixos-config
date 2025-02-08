{ config, pkgs, ... }:

{
  # Permettre les paquets non libres (nécessaire pour certains modèles)
  # nixpkgs.config.allowUnfree = true;

# Ajouter Ollama aux paquets système
  environment.systemPackages = with pkgs; [
    ollama
  ];

# Création automatique des répertoires
  systemd.tmpfiles.rules = [
    "d /home/kebzcool/.ollama 0750 kebzcool users - -"
    "d /home/kebzcool/.ollama/models 0750 kebzcool users - -"
  ];

  # Configuration du service Ollama
systemd.services.ollama = {
    description = "Ollama Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    environment = {
      HOME = "/home/kebzcool";
      OLLAMA_MODELS = "/home/kebzcool/.ollama/models";
      OLLAMA_HOST = "127.0.0.1:11434";
    };

preStart = ''
      # Vérification et création des répertoires si nécessaire
      mkdir -p /home/kebzcool/.ollama/models
      chown -R kebzcool:users /home/kebzcool/.ollama
      chmod -R 750 /home/kebzcool/.ollama
    '';

    serviceConfig = {
      ExecStart = "${pkgs.ollama}/bin/ollama serve";
      User = "kebzcool";
      Group = "users";
      WorkingDirectory = "/home/kebzcool";
      
      # Ajout de directives de redémarrage
      Restart = "on-failure";
      RestartSec = "5s";
      
      # Permissions et limites
      LimitNOFILE = "1048576";
    };
  };

  # Configuration du pare-feu
  networking.firewall = {
    allowedTCPPorts = [ 11434 ];
  };
}
