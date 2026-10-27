{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "bredr"; # Fix frequent Bluetooth audio dropouts
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    smartd = {
      enable = true;
      autodetect = true;
    };
    blueman.enable = true;
    libinput.enable = true;
    fstrim.enable = true;
    upower.enable = true;
  };
}
