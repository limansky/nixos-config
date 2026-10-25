{pkgs, ...}: {

  programs.git = {
    enable = true;
    settings = {
      user.name = "Mike Limansky";
      user.email = "mike.limansky@gmail.com";
    };
    lfs.enable = true;
    package = pkgs.gitFull;
  };

}
