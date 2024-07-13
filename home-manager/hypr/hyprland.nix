{config, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [
      "-all"
    ];
    settings = {
      "$terminal" = "alacritty";
      "$fileManager" = "nautilus";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      monitor = [
        ",preferred,auto,auto"
      ];

      input = {
        kb_layout = "ro";
        kb_variant = "";
        kb_model = "p105+inet";
        kb_options = "lv3:ralt_switch_multikey, grp:sclk_toggle";
        kb_rules = "";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;

        col = {
          active_border = "rgba(33ccffee)";
          inactive_border = "rgba(595959aa)";
        };

        resize_on_border = false;
        allow_tearing = false;

        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enable = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # stops all windows from beign maximized
      windowrulev2 = "suppressevent maximize, class:.*";

      "$mainMod" = "SUPER";

      bind =
        [
          "$mainMod, T, exec, $terminal"
          "$mainMod, E, exec, $fileManager"

          "$mainMod, F, togglefloating,"

          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod ALT, right, workspace, e+1"
          "$mainMod ALT, left, workspace, e-1"

          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"

          "$mainMod, Q, killactive"
          "$mainMod CTRL SHIFT, Q, exit"
        ]
        ++ (
          builtins.concatLists (builtins.getList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                "$mainMod, KP_${ws}, workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, KP_${ws}, movetoworkspace ${toString (x + 1)}"
              ]
            )
            10)
        );

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
