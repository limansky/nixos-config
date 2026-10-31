{pkgs, ...}: {
  home.packages = with pkgs; [
    kubectl
    qgit
    filezilla
  ];
}
