{pkgs}: {
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
    zeroconf.discovery.enable = true;
    extraConfig = ''
      load-module module-equalizer-sink
      load-module module-dbus-protocol
    '';
  };
}
