{pkgs, ...}: {
  home.packages = with pkgs; [
    zoom-us
    telegram-desktop
  ];
}
