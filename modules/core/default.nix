{...}: {
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./system.nix
    ./unfree.nix
    ./sddm.nix
    ./locale.nix
    ./printing.nix
    ./services.nix
    ./sudo.nix
    ./user.nix
    ./packages.nix
    ./fonts.nix
    ./x11.nix
    ./virtualization.nix
  ];
}
