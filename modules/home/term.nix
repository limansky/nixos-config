{
  pkgs,
  dotfiles,
  ...
}: {
  xdg.configFile = {
    wezterm.source = "${dotfiles}/.config/wezterm";
  };

  home.packages = with pkgs; [
    wezterm
    kitty
  ];
}
