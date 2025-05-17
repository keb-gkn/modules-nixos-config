{ config, pkgs, ... }:

{

# QEMU
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  services.qemuGuest.enable = true;

# Waydroid
  virtualisation.waydroid.enable = true;
}
