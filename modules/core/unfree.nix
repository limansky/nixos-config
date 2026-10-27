{lib, config, username, ...}: {
  options = with lib; {
    allowUnfreePackages = mkOption {
      default = [];
      type = with types; listOf str;
      description = "List of unfree packages allowed to be installed";
      example = [ "steam" "zoom" ];
    };
  };

  config = {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) (config.allowUnfreePackages ++ config.home-manager.users.${username}.allowUnfreePackages);
  };
}
