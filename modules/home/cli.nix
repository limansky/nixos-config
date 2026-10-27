{pkgs,...}: {
  home.packages = with pkgs; [
    delta
    ripgrep
    bat
    jq
    bc
  ];
}
