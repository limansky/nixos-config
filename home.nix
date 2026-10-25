{ config, pkgs, dotfiles, ... }:

{
  home.username = "limansky";
  home.homeDirectory = "/home/limansky";

  xresources.properties = {
    "Xcursor.size" = 16;
    #"Xft.dpi" = 172;
    "Xft.dpi" = 144;
  };

  home.packages = with pkgs; [
    delta
    ripgrep
    ncdu
    bat
    libreoffice

    wezterm
    pavucontrol

    kubectl
    sbt
    coursier
    nodejs
    #corepack
    jq
    bc
    maven
    cargo
    rustfmt
    rustc
    rust-analyzer
    clippy
    clang
    sqlite
    qgit
    (callPackage ./adguard.nix {} )
    zoom-us
    telegram-desktop
    nixd
    jetbrains.idea
    zathura

#ai
    # code-cursor
    claude-code

    google-chrome

    gimp
    freecad

#xmonad
    dzen2
    conky
    stalonetray
    dunst
    feh
    scrot
    xkill
    xlockmore
    xautolock

# wayland
    kitty
    waybar
    wofi
    rofi
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gnome
    hyprlock
    hyprshot
    fuzzel

  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Mike Limansky";
      user.email = "mike.limansky@gmail.com";
    };
    lfs.enable = true;
    package = pkgs.gitFull;
  };

  home.stateVersion = "26.05";

  xdg.configFile = {
    hypr.source = "${dotfiles}/.config/hypr";
    # nvim.source = "${dotfiles}/.config/nvim";
  };
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    configType = "hyprlang";
  };
}
