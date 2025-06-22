{ config, pkgs, ... }:

let
  modules = builtins.attrNames (builtins.readDir ./modules);
in
  {
    # Import all modules
    imports = map (name: ./modules/${name}) modules;

    # Packages
    home.packages = with pkgs; [
      google-chrome
      obsidian
      hyprshot
    ];

    # Config files
    home.file = {
    };

    # Environment variables
    home.sessionVariables = {
    };

    # Cursor
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    # Gtk
    gtk = {
      enable = true;
      font = {
        name = "Inter";
        size = 12;
      };
    };

    # Allow unfree
    nixpkgs.config.allowUnfree = true;

    # Enable home-manager
    programs.home-manager.enable = true;

    # Home info
    home.username = "mahmoud";
    home.homeDirectory = "/home/mahmoud";
    home.stateVersion = "25.05";
  }
