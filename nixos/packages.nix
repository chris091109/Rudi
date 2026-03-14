{ config, lib, pkgs, inputs, ... }:

{
  # =========================
  # Core Programs
  # =========================
  programs.firefox.enable = true;
  programs.steam.enable = true;

  # =========================
  # System Packages
  # =========================
  environment.systemPackages = with pkgs; [

    # Productivity
    libreoffice-fresh

    # Dev utilities (non-compiler)
    git
    python3

    # Vulkan / Graphics
    glfw
    cglm
    vulkan-headers
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers

    # Qt / QML
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qtwayland
    qt6.qt5compat

    # Formatters
    nodePackages.prettier

    # Terminal
    alacritty

    # Desktop
    blueman
    vlc
    thunar
    discord
    prismlauncher
    anki

    # Audio
    cava
    pavucontrol

    # System tools
    htop
    btop
    fastfetch
    unzip
    zip
    p7zip
    grimblast
    wofi
  ];
}
