{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Power Management (we can do without)
    powerManagement = {
      enable = false;
      finegrained = false;
    };

    # enable open source nvidia drivers (only works for Turing or newer) (not nouveau)
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
  ];
}
