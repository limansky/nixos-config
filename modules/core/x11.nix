{...}: {
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us,ru";
        options = "grp:shifts_toggle,grp_led:scroll";
        variant = ",winkeys";
      };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];
}
