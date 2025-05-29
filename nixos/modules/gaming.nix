{ config, pkgs, ... }:

{

 environment.systemPackages = with pkgs; [
      heroic
      lutris
      mangohud
    ];

  # Config Mangohud inspiré de GLF-OS https://github.com/Gaming-Linux-FR
environment.sessionVariables = {         
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      # light
        MANGOHUD_CONFIG = "control=mangohud,legacy_layout=0,horizontal,background_alpha=0,gpu_stats,gpu_power,cpu_stats,ram,vram,fps,fps_metrics=AVG,0.001,font_scale=1.05";
      # full
      # MANGOHUD_CONFIG = "control=mangohud,legacy_layout=0,vertical,background_alpha=0,gpu_stats,gpu_power,cpu_stats,core_load,ram,vram,fps,fps_metrics=AVG,0.001,frametime,refresh_rate,resolution, vulkan_driver,wine";
    }; 

    hardware.steam-hardware.enable = true;
    hardware.xone.enable = true;
    hardware.xpadneo.enable = true;
    programs.steam.gamescopeSession.enable = true;

  programs.gamescope = {
   enable = true;
   capSysNice = true;

 };
 # Steam
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
       extraEnv = {
         MANGOHUD = true;
       };
     };
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true; 
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

}
