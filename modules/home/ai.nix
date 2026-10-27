{pkgs, ...}: {
  allowUnfreePackages = [ "claude-code" ];
  home.packages = with pkgs; [
    claude-code
  ];
}
