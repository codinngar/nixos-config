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

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      number = true;
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ];
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 14;
      window-padding-x = 20;
      window-padding-y = 20;
      font-family = "JetBrainsMono Nerd Font";
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
