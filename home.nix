{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    nerd-fonts.jetbrains-mono
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 14;
      window-padding-x = 20;
      window-padding-y = 20;
    };
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
