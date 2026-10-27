{...}: {
  virtualisation = {
    docker = {
      enable = true;
      extraOptions = ''--insecure-registry registry.docker.ofd.nov:5000'';
    };
  };
}
