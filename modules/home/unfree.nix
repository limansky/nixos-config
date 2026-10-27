{lib, ...}: {
  options.allowUnfreePackages = lib.mkOption {
    default = [];
    type = with lib.types; listOf str;
    description = "List of unfree packages allowed to be installed, set from home modules";
    example = ["zoom"];
  };
}
