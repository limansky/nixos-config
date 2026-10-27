{pkgs, ...}: {
  allowUnfreePackages = ["zoom"];

  home.packages = with pkgs; [
    zoom-us
    telegram-desktop
  ];
}
