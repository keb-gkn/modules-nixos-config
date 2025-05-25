{ pkgs, config, lib, ... }:

{
 
  boot = {
    tmp.cleanOnBoot = true;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems.zfs = lib.mkForce false; # Force disable ZFS
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "amd_pstate=active"
      "nosplit_lock_mitigate"
      "nowatchdog" # Turn off AMD hardware watchdog # Turn off Intel hardware watchdog
      "modprobe.blacklist=iTCO_wdt" #"modprobe.blacklist=sp5100_tco"       
    ];

   # Configuration de Plymouth
    plymouth = {    
      enable = true;  
      theme = "black_hud";
      themePackages = [ pkgs.adi1090x-plymouth-themes ];           
    };

   # Enable "Silent Boot" 
    consoleLogLevel = 0; 
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"  
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
   };
      kernel.sysctl = {
        vm_swappiness = 100;
        vm_vfs_cache_pressure = 50;
        vm_dirty_bytes = 268435456;
        vm_dirty_background_bytes = 67108864;
        vm_dirty_writeback_centisecs = 1500;
        kernel_nmi_watchdog = 0; 
        kernel_unprivileged_userns_clone = 1;
        kernel_printk = "3 3 3 3";
        kernel_kptr_restrict = 2;
        kernel_kexec_load_disabled = 1;
      };
    };
   
}

