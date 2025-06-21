{ config, pkgs, ... }:

let
  modules = builtins.attrNames (builtins.readDir ./modules);
in
  {
    imports = map (name: ./modules/${name}) modules;

    home.packages = with pkgs; [
      google-chrome
    ];

    home.file = {
    };

    home.sessionVariables = {
    };

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.whitesur-gtk-theme;
        name = "WhiteSur-Light";
      };
      iconTheme = {
        package = pkgs.whitesur-icon-theme;
        name = "WhiteSur";
      };
      font = {
        name = "Inter";
        size = 12;
      };
    };

    programs.home-manager.enable = true;

    nixpkgs.config.allowUnfree = true;

    home.username = "mahmoud";
    home.homeDirectory = "/home/mahmoud";
    home.stateVersion = "25.05";
  }
