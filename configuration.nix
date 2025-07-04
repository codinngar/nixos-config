{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    brightnessctl
  ];

  # Programs
  programs.zsh.enable = true;

  # MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  # PostgreSQL
  services.postgresql = {
    enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    inter
    noto-fonts
    font-awesome
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];

  # Users
  users.users.mahmoud = {
    isNormalUser = true;
    description = "Mahmoud";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Execluded gnome packages
  environment.gnome.excludePackages = with pkgs; [
    eog                     # image viewer
    epiphany                # web browser
    simple-scan             # document scanner
    yelp                    # help viewer
    geary                   # email client
    seahorse                # password manager
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-weather
    pkgs.gnome-tour
    pkgs.gnome-connections
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Africa/Cairo";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System version
  system.stateVersion = "25.05";
}
