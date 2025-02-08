{ config, pkgs, ... }:

{

 # Enable networking
  networking.networkmanager.enable = true;

  # Configure network interfaces
 # networking.interfaces.enp8s0 = {
   # ipv4.addresses = [ { address = "192.168.1.100"; prefixLength = 24; } ];
   # ipv4.gateway = "192.168.1.1";

# Configure DNS
  networking.nameservers = [ 
  #FDN
  "80.67.169.12" 
  "80.67.169.40"
  
 #Cloudflare
  #"1.1.1.1"
  #"1.0.0.1"
  
  # Google
  #"8.8.8.8"
  #"8.8.4.4"
  
  # OpenDNS
  #"208.67.222.222"
  #"208.67.220.220"
  
  # Quad9
  #"9.9.9.9"
  #"149.112.112.112"
 ];

  # Configure hostname
  networking.hostName = "kebOS";

  # Enable DHCP on another interface (optional)
  #networking.interfaces.enp4s0.useDHCP = true;

  # Additional networking settings (e.g., DNS search domains, routing)
  # networking.dnsSearch = [ "example.com" ];
}

