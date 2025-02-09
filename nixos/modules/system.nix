{ config,... }:

{

 # Fonctionnement de Davinci Resolve avec les GPU AMD 
   hardware.amdgpu.opencl.enable = true; 

  # zRAM Configuration
   zramSwap.enable = true;

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

  # Automatic Garbage collection
   nix.gc = {
     automatic = true;
     dates = "daily";
     options = "--delete-older-than 7d";
  };

  # Auto system Update
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
