{
  description = "Limansky's humble NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # format nix code
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # my good old dotfiles using on Gentoo
    dotfiles = {
      url = "github:limansky/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, alejandra, ... }@inputs: let
    username = "limansky";
    system = "x86_64-linux";
    host = "limansky-nb";
  in {
    # Please replace my-nixos with your hostname
    nixosConfigurations.limansky-nb = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit host;
        inherit username;
      };

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix

        ./profiles/intel

        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.limansky = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit (inputs) dotfiles;
            };
          }
      ];
    };

    formatter.x86_64-linux = inputs.alejandra.packages.x86_64-linux.default;
  };
}
