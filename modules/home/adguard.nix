{pkgs, ...}: {
  home.packages = with pkgs; [
    (callPackage ./modules/software/adguard.nix {})
  ];
}
