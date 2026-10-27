{pkgs, ...}: {
  services = {
    postgresql = {
      enable = true;
      enableTCPIP = true;
      ensureDatabases = ["test"];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
        host  all       all     127.0.0.1/32   trust
        host  all       all     ::1/128        trust
      '';
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no"; # Prevent root from SSH login
        PasswordAuthentication = true; #Users can SSH using kb and password
        KbdInteractiveAuthentication = true;
      };
      ports = [22];
    };
  };
}
