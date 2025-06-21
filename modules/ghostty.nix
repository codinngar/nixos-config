{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 14;
      window-padding-x = 20;
      window-padding-y = 20;
      font-family = "JetBrainsMono Nerd Font";
      resize-overlay = "never";
    };
  };
}
