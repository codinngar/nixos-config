{ config, pkgs, ... }:

let
  modules = builtins.attrNames (builtins.readDir ./modules);
in
  {
    # Import all modules
    imports = map (name: ./modules/${name}) modules;

    # Packages
    home.packages = with pkgs; [
      gcc
      lazygit
      postman
      obsidian
      hyprshot
      code-cursor
      dbeaver-bin
      google-chrome
      jetbrains.idea-community-bin
      gnomeExtensions.dash-to-dock
    ];

    # Config files
    home.file = {
    };

    # Environment variables
    home.sessionVariables = {
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
