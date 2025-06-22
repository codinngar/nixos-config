{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 20;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "power-profiles-daemon" "battery" "pulseaudio" "backlight" "network" "custom/notification" ];
        clock = {
          tooltip = false;
          interval = 60;
          format = "{:%I:%M %p | %A %d/%m/%Y}";
        };
        battery = {
          tooltip = false;
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        pulseaudio = {
          tooltip = false;
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = "";
          scroll-step = 1;
        };
        network = {
          tooltip = false;
          format-wifi = "{icon}  {essid}";
          format-icons = "";
          format-disconnected = " ";
          format-disabled = " ";
          on-click-right = "/home/mahmoud/.nix-profile/bin/toggle-wifi";
        };
        backlight = {
          tooltip = false;
          format = "{icon} {percent}%";
          format-icons = "󰖨";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫 ";
            none = "󰂜 ";
            dnd-notification = "󰂛 ";
            dnd-none = "󰂛 ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
        power-profiles-daemon = {
          format = "{icon} ";
          tooltip-format = "{profile}";
          tooltip = true;
          format-icons = {
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-weight: 600;
        font-size: 14px;
        border: none;
        box-shadow: none;
      }

      window#waybar {
        color: white;
        background: rgba(0, 0, 0, 0.5);
      }

      #workspaces button {
        padding: 5px 8px;
        color: white;
        transition: 0;
      }

      #workspaces button:hover {
        background: transparent;
        color: white;
      }

      #workspaces button.active {
        background: rgba(255, 255, 255, 0.2);
        color: white;
      }

      .modules-right {
        padding-right: 10px;
      }

      #custom-notification {
        font-size: 16px;
      }
    '';
  };
}
