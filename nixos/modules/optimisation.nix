{ config,... }:

{

 # Fonctionnement de Davinci Resolve avec les GPU AMD 
   hardware.amdgpu.opencl.enable = true; 

  # zRAM Configuration
   zramSwap.enable = true;

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
