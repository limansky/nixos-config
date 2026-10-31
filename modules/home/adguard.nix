{pkgs, ...}: {
  home.packages = with pkgs; [
    (callPackage ../software/adguard.nix {})
  ];
}
