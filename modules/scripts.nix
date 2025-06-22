{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "power-menu" ''
      #!/bin/bash

      shutdown="  Shutdown"
      reboot="  Reboot"
      lock="  Lock"
      logout="  Logout"

      choice=$(printf "%s\n%s\n%s\n%s\n" "$lock" "$logout" "$reboot" "$shutdown" | rofi -dmenu -i -p "" -theme-str 'window {width: 15%; height: 35%;}')

      case "$choice" in
          "$shutdown") systemctl poweroff ;;
          "$reboot") systemctl reboot ;;
          "$lock") hyprlock ;;
          "$logout") hyprctl dispatch exit ;;
          *) exit 1 ;;
      esac
    '')
  ];
}
