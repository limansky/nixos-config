{
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (lib.generators) mkLuaInline toLua;
  lua = toLua {};
  ipc = "noctalia msg";
  mainMod = "SUPER";
  exec = cmd: "hl.dsp.exec_cmd(${lua cmd})";
  binds =
    [
      {
        keys = "${mainMod} + RETURN";
        dsp = exec "wezterm";
        desc = "Terminal";
      }
      {
        keys = "${mainMod} + r";
        dsp = exec "${ipc} panel-toggle launcher";
        desc = "Runner";
      }
      {
        keys = "ALT + Tab";
        dsp = exec "${ipc} window-switcher hold";
        desc = "Switch to next window";
      }
      {
        keys = "ALT + SHIFT + Tab";
        dsp = exec "${ipc} window-switcher hold reverse";
        desc = "Switch to prev window";
      }
      {
        keys = "${mainMod} + SHIFT + s";
        dsp = exec "${ipc} screenshot-fullscreen --copy-to-clipboard --no-save-to-file";
        desc = "Take screenshot";
      }
      {
        keys = "${mainMod} + SHIFT + c";
        dsp = "hl.dsp.window.close()";
        desc = "Close active window";
      }
      {
        keys = "${mainMod} + j";
        dsp = "hl.dsp.window.cycle_next()";
        desc = "Next window";
      }
      {
        keys = "${mainMod} + k";
        dsp = "hl.dsp.window.cycle_next({ next = false;})";
        desc = "Next window";
      }
      {
        keys = "${mainMod} + f";
        dsp = "hl.dsp.window.fullscreen()";
        desc = "Fullscreen";
      }
      {
        keys = "${mainMod} + mouse:272";
        dsp = "hl.dsp.window.drag()";
        desc = "move";
      }
      {
        keys = "${mainMod} + mouse:273";
        dsp = "hl.dsp.window.resize()";
        desc = "move";
      }
      {
        keys = "XF86AudioRaiseVolume";
        dsp = exec "${ipc} volume-up";
        desc = "Volume up";
      }
      {
        keys = "XF86AudioLowerVolume";
        dsp = exec "${ipc} volume-down";
        desc = "Volume down";
      }
      {
        keys = "XF86AudioMute";
        dsp = exec "${ipc} volume-mute";
        desc = "Volume mute";
      }
    ]
    ++ lib.concatMap (i: let
      key = toString (lib.mod i 10);
    in [
      {
        keys = "${mainMod} + ${key}";
        dsp = "hl.dsp.focus({ workspace = ${toString i} })";
        desc = "Workspace ${toString i}";
      }
      {
        keys = "${mainMod} + SHIFT + ${key}";
        dsp = "hl.dsp.window.move({ workspace = ${toString i} })";
        desc = "Move to workspace ${toString i}";
      }
    ]) (lib.range 1 10);

  windowRule = match: effects: effects // {inherit match;};
  onEvent = event: cmds: {
    _args = [
      event
      (mkLuaInline "function()\n${lib.concatMapStrings (c: "  hl.exec_cmd(${lua c})\n") cmds}end")
    ];
  };
in {
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gnome
  ];

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd = {
      enable = false;
      # enableXdgAutostart = true;
    };
    configType = "lua";
    settings = {
      monitor = [
        { output = "eDP-1"; mode = "prefered"; position = "0x0"; scale = 1.25; }
        { output = "HDMI-A-1"; mode = "prefered"; position = "auto-right"; scale = 1.5; }
      ];
      config = {
        input = {
          kb_layout = "us,ru";
          kb_options = "grp:shifts_toggle";
          kb_variant = ",winkeys";
        };
        decoration = {
          rounding = 20;
          rounding_power = 2;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "0xee1a1a1a";
          };

          blur = {
            enabled = true;
            xray = true;
            size = 3;
            passes = 2;
            vibrancy = 0.1696;
          };
        };
      };
      bind = map (b: {_args = [b.keys (mkLuaInline b.dsp) {description = b.desc;}];}) binds;
      on = [
        (onEvent "hyprland.start" [
          "noctalia"
        ])
      ];
      window_rule = [
        (windowRule {fullscreen = true;} {rounding = 0;})
        (windowRule { float = false; workspace = "w[tv1]"; } { border_size = 0; })
        (windowRule { float = false; workspace = "w[tv1]"; } { rounding = 0; })
        (windowRule { float = false; workspace = "f[1]"; } { border_size = 0; })
        (windowRule { float = false; workspace = "f[1]"; } { rounding = 0; })
        (windowRule { title = "^(Картинка в картинке)$"; } { float = true; })
        (windowRule { title = "^(Картинка в картинке)$"; } { pin = true; })
        (windowRule { class = "^(firefox)$"; } { workspace = 2; } )
      ];

      workspace_rule = [
        { workspace = "w[tv1]"; gaps_out = 0; gaps_in = 0; }
        { workspace = "f[1]"; gaps_out = 0; gaps_in = 0; }
        { workspace = 2; default_name = "web"; }
      ];
    };
  };

  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
      location = {
        address = "Nizhniy Novgorod";
      };
      widget = {
        weather = {
          show_condition = false;
        };
        tray = {
          hidden = [ "nm-applet" "blueman" ];
        };
      };
      bar.default = {
        position = "top";
        margin_edge = 0;
        margin_ends = 0;
        background_opacity = 0.6;
        start = [
          "launcher"
          "workspaces"
        ];
        center = [
          "media"
        ];
        end = [
          "tray"
          "keyboard_layout"
          "battery"
          "volume"
          "network"
          "sysmon"
          "spacer_default"
          "weather"
          "clock"
          "session"
        ];
      };
    };
  };
}
