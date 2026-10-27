{pkgs, ...}: {
  allowUnfreePackages = ["idea"];

  home.packages = with pkgs; [
    sbt
    coursier
    maven
    jetbrains.idea
  ];
}
