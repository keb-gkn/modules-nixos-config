{ config, lib, pkgs, ... }:


    let
      allUsers = builtins.attrNames config.users.users;
      normalUsers = builtins.filter (user: config.users.users.${user}.isNormalUser) allUsers;
    in
    { 
  services.printing = {
    enable = true;
    drivers = with pkgs; [ 
      cups-kyocera-ecosys-m2x35-40-p2x35-40dnw
      brgenml1cupswrapper
      brgenml1lpr
      brlaser
      cnijfilter2
      epkowa
      gutenprint
      gutenprintBin
      hplip
      hplipWithPlugin
      samsung-unified-linux-driver
      splix
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Scanner support
    hardware.sane = {
     enable = true;
     extraBackends = with pkgs; [
          hplipWithPlugin
          sane-airscan
          epkowa
    ];
  };

  networking.firewall = {
    allowedUDPPorts = [ 631 ];
  };

  # Configuration des utilisateurs et groupes
     users.groups.scanner.members = normalUsers;
     users.groups.lp.members = normalUsers;     
 
}
