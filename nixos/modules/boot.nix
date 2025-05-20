{ pkgs, config, lib, ... }:

{

  boot = {
    tmp.cleanOnBoot = true;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = lib.mkDefault pkgs.linuxPackages_cachyos;
    kernelParams = [ "amd_pstate=active" ];

    # Configuration de Plymouth
    plymouth = {
      enable = true;
      theme = "owl";
      themePackages = with pkgs; [
        # Installation du thème spécifique "owl"
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ "owl" ];
        })
      ];
    };
  };


}
