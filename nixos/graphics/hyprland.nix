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

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager.sddm.defaultSession = "hyprland";
}
