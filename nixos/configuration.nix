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
  # You can import other NixOS modules here
  imports = [
    # My modules
    ./users.nix
    ./xresources-nord.nix

    # Hardware configuration (nixos-generate-config)
    ./hardware-configuration.nix
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
      pulseaudio = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
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

  services = {
    xserver = {
      enable = true;
      windowManager.awesome = {
        enable = true;
        package = pkgs.awesome.overrideAttrs {
          version = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
          src = pkgs.fetchFromGitHub {
            owner = "awesomeWM";
            repo = "awesome";
            rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
            hash = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
          };
          patches = [];
          postPatch = ''
            patchShebangs tests/examples/_postprocess.lua
          '';
        };
        luaModules = with pkgs.luaPackages; [
          luarocks-nix
          luadbi-mysql
        ];
      };
      xkb = {
        layout = "ro";
        model = "p105+inet";
        variant = "";
        options = "lv3:ralt_switch_multikey, grp:sclk_toggle";
      };
    };
    displayManager = {
      defaultSession = "none+awesome";
      sddm = {
        enable = true;
        theme = "nord";
      };
    };
    picom = {
      enable = true;
      # settings = {};
    };
  };

  # Enabling sound
  sound.enable = true;
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

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Power Management (we can do without)
    powerManagement = {
      enable = false;
      finegrained = false;
    };

    # Enable open source nvidia drivers (only works for Turing or newer)(not nouveau)
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
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
      ]))
    lua54Packages.lua
    lua54Packages.luarocks-nix
    stylua

    # terminals
    alacritty
    termite

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
    xclip
    upower
    bluez
    bluez-alsa
    bluez-tools
    xfce.xfce4-power-manager
    playerctl
    flameshot
    kitty
    pwvucontrol
    pciutils
    toybox

    # lua
    extraLuaPackages.dbus_proxy
    extraLuaPackages.enum
    extraLuaPackages.pulseaudio_dbus
    extraLuaPackages.upower_dbus

    # xorg
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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
