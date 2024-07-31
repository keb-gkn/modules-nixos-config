{pkgs}: {
  hardware.pulseaudio = {
    enable = false;
  };

  services = {
    displayManager = {
      sddm = {
        wayland = {
          enable = true;
        };
      };
    };
    pipewire = {
      enable = true;
      audio = {
        enable = true;
      };
      systemWide = true;
      socketActivation = true;
      raopOpenFirewall = true;
      wireplumber = {
        enable = true;
        extraConfig.bluetoothEnhancements = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [
              "hsp_hs"
              "hsp_ag"
              "hfp_hf"
              "hfp_ag"
            ];
          };
        };
      };
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
      jack = {
        enable = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    #wayland
    wl-clipboard
    wl-clipboard-x11
    egl-wayland

    # pipewire
    pwvucontrol
  ];
}
