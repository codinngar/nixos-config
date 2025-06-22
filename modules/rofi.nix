{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
  {
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono Nerd Font Semibold 14";

      extraConfig = {
        show-icons = true;
      };

      theme = {
        "element-text" = {
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
          text-color = mkLiteral "inherit";
        };

        "window" = {
          width = 600;
          height = 500;
          border = 1;
          border-color = mkLiteral "rgba(255, 255, 255, 0.1)";
          border-radius = 15;
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
        };

        "mainbox" = {
          background-color = mkLiteral "rgba(0, 0, 0, 0.5)";
        };

        "inputbar" = {
          children = map mkLiteral [ "prompt" "entry" ];
          border = mkLiteral "0 0 1px 0";
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
          border-color = mkLiteral "rgba(255, 255, 255, 0.1)";
          padding = 20;
        };

        "prompt" = {
          text-color = mkLiteral "#ffffff";
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
        };

        "entry" = {
          text-color = mkLiteral "#ffffff";
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
        };

        "listview" = {
          padding = mkLiteral "30px 20px";
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
        };

        "element" = {
          padding = 15;
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
          border-radius = 10;
          spacing =  20;
          text-color = mkLiteral "#ffffff";
        };

        "element selected" = {
          background-color = mkLiteral "rgba(255, 255, 255, 0.1)";
          text-color = mkLiteral "#ffffff";
        };

        "element-icon" = {
          size = 30;
          background-color = mkLiteral "rgba(0, 0, 0, 0)";
        };
      };
    };

    home.file."~/.config/rofi/scripts/power-menu.sh" = {
      executable = true;
      text = ''
        #!/bin/bash

        # Options
        shutdown="  Shutdown"
        reboot="  Reboot"
        lock="  Lock"
        logout="  Logout"

        # Get user's choice
        choice=$(printf "%s\n%s\n%s\n%s\n" "$lock" "$logout" "$reboot" "$shutdown" | rofi -dmenu -i -p "" -theme-str 'window {width: 15%; height: 35%;}')

        case "$choice" in
            "$shutdown") systemctl poweroff ;;
            "$reboot") systemctl reboot ;;
            "$lock") hyprlock ;;
            "$logout") hyprctl dispatch exit ;;
            *) exit 1 ;;
        esac
      '';
    };
  }
