{pkgs, ...}: {
  home.packages = with pkgs; [
    delta
    ripgrep
    jq
    bc

    ncdu
  ];

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
    ];
  };
}
