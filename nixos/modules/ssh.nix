{ pkgs, lib, ... }:

{
  # Configuration SSH
  services.openssh = {
    enable = true;
    ports = [22000];                                 
    settings = {
      PasswordAuthentication = false;              
      PermitRootLogin = "no";                     
      AllowGroups = [ "wheel" ];                  
    };
  }; 
}
