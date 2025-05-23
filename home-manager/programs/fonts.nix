{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    open-sans
  ];
}
