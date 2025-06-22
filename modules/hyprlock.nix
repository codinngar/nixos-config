{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      "$font" = "JetBrainsMono Nerd Font";

      general = {
        hide_cursor = false;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [ "fadeIn, 1, 5, linear" "fadeOut, 1, 5, linear" "inputFieldDots, 1, 2, linear" ];
      };

      background = {
        path = "/home/mahmoud/nixos-config/assets/wallpaper.jpg";
        blur_passes = 3;
      };

      input-field = {
        size = "20%, 5%";
        outline_thickness = 3;
        inner_color = "rgba(0, 0, 0, 0)";
        outer_color = "rgb(255, 255, 255)";
        check_color = "rgb(255, 153, 51)";
        fail_color = "rgb(255, 0, 0)";
        font_color = "rgb(255, 255, 255)";
        fade_on_empty = false;
        rounding = 15;
        font_family = "$font";
        placeholder_text = "Enter your password";
        fail_text = "$PAMFAIL";
        dots_text_format = "*";
        dots_size = 0.4;
        dots_spacing = 0.3;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          text = "$TIME";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        {
          text = "$LAYOUT[en,ar]";
          font_size = 24;
          position = "250, -20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
