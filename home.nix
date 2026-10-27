{ config, pkgs, dotfiles, ... }:

{
  xresources.properties = {
    "Xcursor.size" = 16;
    #"Xft.dpi" = 172;
    "Xft.dpi" = 144;
  };

  home.packages = with pkgs; [
    ncdu
    libreoffice

    wezterm
    pavucontrol

    kubectl
    nodejs
    #corepack
    qgit
    (callPackage ./modules/software/adguard.nix {} )
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
    dunst
    scrot

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
