{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    plymouth = {
      enable = true;
      theme = "black_hud";
      themePackages = with pkgs; [
        # Install wanted theme only
        (adi1090x-plymouth-themes.override {
          selected_themes = ["black_hud"];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [];
      verbose = false;
      systemd = {
        enable = true;
        storePaths = [config.console.font];
      };
    };
    extraModulePackages = [];
    kernelModules = ["kvm-amd"];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      grub = {
        enable = true;
        theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        splashImage = ../assets/raven_eats_eye_2556x1440.png;
        splashMode = "stretch";
      };
      timeout = 5;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/28a2cde3-1c4b-4afd-9dca-0a3bccd9b3e2";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8A1A-FD75";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/28a2cde3-1c4b-4afd-9dca-0a3bccd9b3e2";
    fsType = "btrfs";
    options = ["subvol=@home"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/28a2cde3-1c4b-4afd-9dca-0a3bccd9b3e2";
    fsType = "btrfs";
    options = ["subol=@nix"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/28a2cde3-1c4b-4afd-9dca-0a3bccd9b3e2";
    fsType = "btrfs";
    options = ["subvol=@log"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/68fc0507-3721-4d66-9100-9e58e0a55210";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
