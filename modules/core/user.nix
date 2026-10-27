{
  pkgs,
  inputs,
  username,
  ...
}: {
  programs.fish.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = ["${username}"];

  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit (inputs) dotfiles;
    };
    users.${username} = {
      imports = [./../home ./../../home.nix];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };
    };
  };
}
