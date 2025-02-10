{ config, pkgs, ... }:

{

# QEMU
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  services.qemuGuest.enable = true;

 # VMware
  virtualisation.vmware.host.enable = true;

  virtualisation.vmware.guest = {
    enable = true;
    headless = true;
  };
  virtualisation.waydroid.enable = true;
}
