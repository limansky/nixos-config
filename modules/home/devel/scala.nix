{pkgs, ...}: {
  home.packages = with pkgs; [
    sbt
    coursier
    maven
  ];
}
