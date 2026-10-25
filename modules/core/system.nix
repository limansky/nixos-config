{host, ...}: 
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command" "flakes"
      ];
    };
  };

  # DO NOT TOUCH THIS. It's initial version
  system.stateVersion = "26.05";
}
