{ config, pkgs, ... }:

let
  modules = builtins.attrNames (builtins.readDir ./modules);
in
  {
    imports = map (name: ./modules/${name}) modules;

    home.packages = with pkgs; [
      google-chrome
      nerd-fonts.jetbrains-mono
    ];

    home.file = {
    };

    home.sessionVariables = {
    };

    programs.home-manager.enable = true;

    nixpkgs.config.allowUnfree = true;

    home.username = "mahmoud";
    home.homeDirectory = "/home/mahmoud";
    home.stateVersion = "25.05";
  }
