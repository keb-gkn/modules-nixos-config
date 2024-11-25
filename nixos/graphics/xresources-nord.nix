{pkgs, ...}: {
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
      ! special
      *.foreground:   #d8dee9
      *.background:   #242933
      *.cursorColor:  #d8dee9

      ! black
      *.color0:       #191d24
      *.color8:       #3b4252

      ! red
      *.color1:       #bf616a
      *.color9:       #d06f79

      ! green
      *.color2:       #a3be8c
      *.color10:      #b1d196

      ! yellow
      *.color3:       #ebcb8b
      *.color11:      #f0d399

      ! blue
      *.color4:       #81a1c1
      *.color12:      #88c0d0

      ! magenta
      *.color5:       #b48ead
      *.color13:      #c895bf

      ! cyan
      *.color6:       #8fbcbb
      *.color14:      #93ccdc

      ! white
      *.color7:       #d8dee9
      *.color15:      #e5e9f0
    ''}
  '';
}
