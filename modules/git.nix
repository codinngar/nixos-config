{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "codinngar";
    userEmail = "codinngar@gmail.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
