{nixvim,...}: {
  imports = [
    ./opts.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.kanagawa = {
      enable = true;
    };
  };

}
