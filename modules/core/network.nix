{
  host,
  pkgs,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openconnect];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
      ];
    };
  };
}
