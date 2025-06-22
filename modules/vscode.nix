{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        christian-kohler.path-intellisense
      ];
    };
  };
}
