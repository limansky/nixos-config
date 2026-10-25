{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    killall
    adwaita-icon-theme
    wget
    unixtools.net-tools
    networkmanagerapplet
    mc
    file
    xclip
    unzip
  ];
}
