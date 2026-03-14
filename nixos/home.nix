{ pkgs, ... }:

{
  # Home Manager settings
  home.username = "chris";
  home.homeDirectory = "/home/chris";
  home.stateVersion = "25.11";

  # Disable version check due to mismatch between Home Manager and NixOS
  home.enableNixpkgsReleaseCheck = false;

  # Packages to install for user
  home.packages = with pkgs; [
    (nerd-fonts.caskaydia-cove) # CascadiaCode Nerd Font
    jetbrains-mono
    bibata-cursors
    papirus-icon-theme
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Only provide plugins that lazy.nvim cannot download itself
    # (i.e. ones that need compiled C extensions / grammars managed by Nix)
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];

    extraPackages = with pkgs; [
      # C / C++
      gcc
      clang
      clang-tools
      cmake
      gnumake
      lldb

      # Java
      jdk21

      # Lua
      lua-language-server

      # Nix
      nil
      nixpkgs-fmt

      # JSON (used by jsonls in lsp.lua)
      nodePackages.vscode-json-languageserver
    ];
  };

    # Shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };

    initExtraBeforeCompInit = ''
      export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
    '';

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake .#NIX-btw";
      nixConf = "cd /etc/nixos/ && sudo nvim configuration.nix";
      nixFlake = "cd /etc/nixos/ && sudo nvim flake.nix";
      nixHome = "cd /etc/nixos/ && sudo nvim home.nix";
    };
  };

  # GTK configuration
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  gtk.cursorTheme.size = 24;
  gtk.theme.package = pkgs.graphite-gtk-theme.override {
    tweaks = [ "black" "rimless" ];
  };
  gtk.theme.name = "Graphite-Dark";
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };

  xdg.configFile."gtk-3.0/settings.ini".force = true;

  home.file = {
    ".icons/bibata".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  # Qt configuration
  qt.enable = true;
  qt.style.name = "adwaita-dark";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}


