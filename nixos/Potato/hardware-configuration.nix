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
        spashMode = "stretch";
      };
      timeout = 5;
    };
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmare;
}
