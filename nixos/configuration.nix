{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];

  # ===== BOOT CONFIGURATION =====
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  # ===== NETWORKING =====
  networking = {
    hostName = "NIX-btw";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # ===== LOCALIZATION =====
  time.timeZone = "Australia/Perth";
  
  i18n.defaultLocale = "en_US.UTF-8";

  # ===== FONTS =====
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
  ];

  # ===== USER CONFIGURATION =====
  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "input" "video" ];
  };
  
  services.getty.autologinUser = "chris";
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # ===== DISPLAY SERVER =====
  # xserver is disabled (Wayland-only), but videoDrivers must be set here
  # for NixOS to load the NVIDIA kernel modules correctly
  services.xserver = {
    enable = false;
    videoDrivers = [ "nvidia" ];
  };

  # ===== NVIDIA WAYLAND ENV VARS =====
  environment.sessionVariables = {
    # Core NVIDIA Wayland support
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";

    # Fix GTK4 "Error 71 Protocol error" on NVIDIA Wayland
    GSK_RENDERER = "gl";

    # Hyprland NVIDIA fixes
    WLR_NO_HARDWARE_CURSORS = "1";

    # Ozone Wayland for Electron apps (Discord, VS Code, etc.)
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # Qt Wayland
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    # XDG session
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  # ===== WINDOW MANAGER =====
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # ===== AUDIO =====
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  # ===== HARDWARE =====
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      powerManagement.enable = true;
    };
    
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    
    uinput.enable = true;
  };

  # ===== SERVICES =====
  services.openssh.enable = true;

  # ===== WAYLAND-SPECIFIC SETTINGS =====
  xdg.portal = {
    enable = true;
    # wlr.enable conflicts with Hyprland - use hyprland portal instead
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  # ===== PROGRAMS =====
  programs.bash.completion.enable = true;

  # ===== NIX SETTINGS =====
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # Hyprland binary cache (faster builds)
    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  system.stateVersion = "26.05";
}

