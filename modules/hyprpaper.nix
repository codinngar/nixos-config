{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/mahmoud/nixos-config/assets/wallpaper.jpg" ];
      wallpaper = [ ", /home/mahmoud/nixos-config/assets/wallpaper.jpg" ];
    };
  };
}
