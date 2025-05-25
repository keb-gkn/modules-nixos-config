{ pkgs, config, lib, ... }:

{

  boot = {
    tmp.cleanOnBoot = true;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    kernelParams = [ "amd_pstate=active" ];
     };
      kernel.sysctl = {
        vm_swappiness = 100;
        vm_vfs_cache_pressure = 50;
        vm_dirty_bytes = 268435456;
        "vm.page-cluster" = 0;
        vm_dirty_background_bytes = 67108864;
        vm_dirty_writeback_centisecs = 1500;
        kernel_nmi_watchdog = 0;
        kernel_unprivileged_userns_clone = 1;
        kernel_printk = "3 3 3 3";
        kernel_kptr_restrict = 2;
        kernel_kexec_load_disabled = 1;
      };

    # Configuration de Plymouth
    plymouth = {
      enable = true;
      theme = "owl";
      themePackages = with pkgs; [
        # Installation du thème spécifique "owl"
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ "owl" ];
        };
      ];
    };
  };


}
