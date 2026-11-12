{...}: {
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;

      lualine = {
        enable = true;
      };

      bufferline = {
        enable = true;
        settings.options = {
          mode = "tabs";
        };
      };

      which-key = {
        enable = true;
      };

      nvim-tree = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "tc";
        action = "<cmd>NvimTreeFindFileToggle<CR>";
        options = {
          desc = "Toggle current file in file explorer";
        };
      }
    ];
  };
}
