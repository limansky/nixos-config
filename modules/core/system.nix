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
  system.stateVersion = "25.11"; # Did you read the comment?
}
