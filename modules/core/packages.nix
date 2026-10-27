{pkgs, ...}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    firefox = {
      enable = true;
      languagePacks = ["en-US" "ru"];
    };

    git.enable = true;

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };
  };
}
