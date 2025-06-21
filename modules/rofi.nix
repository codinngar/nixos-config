{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
  {
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono Nerd Font Semibold 14";

      extraConfig = {
        prompt = "";
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
          text-color = mkLiteral "text";
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
  }
