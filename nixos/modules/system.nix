{ lib, config, pkgs, ... }:

{

  # zRAM Configuration
   zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 25;
      priority = 5;
    };

   hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-gpu-tools
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        libva
        mesa
      ];
      extraPackages32 = with pkgs; [
        intel-gpu-tools
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        libva
        
      ];
    };

  # Automatic Garbage
   nix.gc = {
     automatic = true;
     dates = "daily";
     options = "--delete-older-than 7d";
  };

  # System Update
   system.autoUpgrade = {
     enable = true;
     dates = "weekly";
  };
    nix = {
      optimise = {
	automatic = true;
	dates = [ "weekly" ];
    };
  };
}
