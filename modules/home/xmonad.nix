{pkgs, ...}: {
  home.packages = with pkgs; [
    dzen2
    conky
    stalonetray
    feh
    xkill
    xlockmore
    xautolock
    scrot
  ];

  xresources.properties = {
    "Xcursor.size" = 16;
    #"Xft.dpi" = 172;
    "Xft.dpi" = 144;
  };
}
