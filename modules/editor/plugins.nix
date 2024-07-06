{
  plantuml-syntax.enable = true;

  trouble = {
    enable = true;
    settings = {
      auto_open = false;
      position = "right";
    };
  };

  telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>fx" = "treesitter";
    };
  };

  barbar = {
    enable = true;
    keymaps = {
      next.key = "<TAB>";
      previous.key = "<S-TAB>";
      close.key = "<C-w>";
    };
  };

  neo-tree.enable = true;
  nix.enable = true;
  markdown-preview.enable = true;
  lualine.enable = true;
  gitsigns.enable = true;
  nvim-autopairs.enable = true;
  surround.enable = true;
  commentary.enable = true;
}
