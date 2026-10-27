{pkgs, ...}: {
  home.packages = with pkgs; [
    dzen2
    conky
    stalonetray
    feh
    xkill
    xlockmore
    xautolock
  ];
}
