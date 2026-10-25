{...}: {
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./system.nix
    ./sddm.nix
    ./locale.nix
    ./printing.nix
  ];
}
