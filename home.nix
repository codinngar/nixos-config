{ config, pkgs, ... }:

{
  imports = [
    ./modules/git.nix
    ./modules/ssh.nix
    ./modules/zsh.nix
    ./modules/vim.nix
    ./modules/vscode.nix
    ./modules/ghostty.nix
  ];

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
