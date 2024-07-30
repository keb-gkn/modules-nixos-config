# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # TODO: split into multiple files (one for hyprland and all related stuff, one for pipewire and all replated stuff, one for installed programs (general), you get the jist)

  # You can import other NixOS modules here
  imports = [
    # My modules
    ./users.nix
    ./graphics/xresources-nord.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  security = {
    polkit = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.xwayland = {
    enable = true;
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "ro";
        model = "p105+inet";
        variant = "";
        options = "lv3:ralt_switch_multikey, grp:sclk_toggle";
      };
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
        theme = "nord";
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

  # Enabling sound
  sound.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr = {
      enable = true;
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };
  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
    zeroconf.discovery.enable = true;
    extraConfig = ''
      load-module module-equalizer-sink
      load-module module-dbus-protocol
    '';
  };

  # Enable internet
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
    packages = with pkgs; [
      terminus_font
      kbd
    ];
    useXkbConfig = true;
  };

  networking.hostName = "ASIMOV";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # My traceroute
  programs.mtr.enable = true;

  # GnuPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.dconf = {
    enable = true;
  };

  programs.command-not-found = {
    enable = false;
  };

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  # Required for SDDM
  qt.style = "breeze";

  environment.systemPackages = with pkgs; [
    # build tools & dev
    gnumake
    cmake
    binutils
    libgcc
    libclang
    scons
    (python3.withPackages (ps:
      with ps; [
        pip
        requests
        xlib
      ]))
    lua54Packages.lua
    lua54Packages.luarocks-nix
    stylua

    # terminals
    alacritty
    termite
    kitty

    # shells
    fish

    #shell utils
    bat
    colordiff
    curl
    wget

    # icons
    papirus-nord

    # cursors
    nordzy-cursor-theme

    # utils
    pciutils
    toybox

    # wayland
    wl-clipboard
    wl-clipboard-x11
    egl-wayland

    # lua custom packages
    extraLuaPackages.dbus_proxy
    extraLuaPackages.enum
    extraLuaPackages.pulseaudio_dbus
    extraLuaPackages.upower_dbus

    # power management
    upower
    xfce.xfce4-power-manager

    # audio / control
    pwvucontrol
    playerctl

    # bluetooth
    bluez
    bluez-alsa
    bluez-tools

    # xorg
    xclip
    xorg.xrdb
    xorg.xfs
    xorg.xfd
    xorg.xwd
    xorg.xpr
    xorg.xsm
    xorg.xev
    xorg.xwud
    xorg.xset
    xorg.xmag
    xorg.luit
    xorg.xprop
    xorg.xmore
    xorg.xload
    #xorg.xkill
    #xorg.xinit
    #xorg.xhost
    xorg.xrandr
    xorg.imake
    xorg.xvinfo
    xorg.xinput
    xorg.xgamma
    xorg.xcmsdb
    xorg.xkbevd
    xorg.xmodmap
    xorg.xkbcomp
    xorg.xfsinfo
    xorg.viewres
    xorg.smproxy
    xorg.xstdcmap
    xorg.xsetroot
    xorg.xrefresh
    xorg.xmessage
    xorg.xkbprint

    # settings
    xsettingsd

    # neovim
    inputs.neovim-flake.packages.x86_64-linux.maximal

    # sddm
    sddm-themes.nord
    libsForQt5.full
    libsForQt5.plasma-framework
    libsForQt5.breeze-qt5
    libsForQt5.breeze-icons

    # steam
    steamPackages.steamcmd
    steamPackages.steam-runtime
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
