{ pkgs, lib, ... }:

{
  # Configuration SSH
  services.openssh = {
    enable = true;
    ports = [2002];                                 
    settings = {
      PasswordAuthentication = false;              
      PermitRootLogin = "no";                     
      AllowGroups = [ "wheel" ];                  
    };
  }; 
}
