{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    ghostty
    nerd-fonts.jetbrains-mono
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityFile ~/.ssh/id_ed25519
        AddKeysToAgent yes
    '';
  };

  programs.git = {
    enable = true;
    userName = "codinngar";
    userEmail = "codinngar@gmail.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.username = "mahmoud";
  home.homeDirectory = "/home/mahmoud";
  home.stateVersion = "25.05";
}
