{pkgs, ...}: {
  imports = [
    ./wayland.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.xwayland = {
    enable = true;
  };

  xdg.portal = {
    wlr = {
      enable = true;
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  services.displayManager.sddm.defaultSession = "hyprland";
}
