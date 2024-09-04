{
  cmp-nvim-lsp.enable = true;
  cmp-buffer.enable = true;
  cmp-path.enable = true;
  cmp-cmdline.enable = true;
  cmp_luasnip.enable = true;

  luasnip = {
    enable = true;
    extraConfig = {
      enable_autosnippets = true;
      store_selection_keys = true;
    };
  };

  cmp = {
    enable = true;
    settings = {
      snippet.expand = "luasnip";
      autoEnableSources = true;
      mapping = {
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      sources = [
        {name = "path";}
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {
          name = "buffer";
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
        {name = "neorg";}
      ];
    };
  };
}
