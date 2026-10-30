{pkgs, ...}: {
  allowUnfreePackages = ["google-chrome"];

  home.packages = with pkgs; [
    google-chrome
    libreoffice
    zathura
  ];
}
