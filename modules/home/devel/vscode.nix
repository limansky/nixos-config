{pkgs, ...}: {

  allowUnfreePackages = [ "vscode" ];

  home.packages = with pkgs; [
    vscode
  ];
}
