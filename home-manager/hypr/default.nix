{
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [
      "-all"
    ];
  };
}
