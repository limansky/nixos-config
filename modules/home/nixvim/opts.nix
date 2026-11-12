{nixvim,...}:{
  programs.nixvim.opts = {
    autowrite = true;
    expandtab = true;
    tabstop = 2;
    shiftwidth = 2;
    smarttab = true;
    smartindent = true;
    number = true;
    ruler = true;
    termguicolors = true; # set colors from cheme
    cursorline = true;
    ignorecase = true;
    incsearch = true;
    undofile = true;
    list = true;
    listchars = {
      tab = "▸ ";
      trail = "·";
      nbsp = "+";
    };
    scrolloff = 5;
  };
}
