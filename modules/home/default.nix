{...}: {
  imports = [
    ./cli.nix
    ./term.nix
    ./git.nix
    ./tools.nix
    ./xmonad.nix
    ./wayland.nix
    ./messaging.nix
    ./unfree.nix
    ./graphics.nix
    ./ai.nix
    ./office.nix
    ./adguard.nix

    ./devel
  ];
}
