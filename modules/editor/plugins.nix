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

  lsp = {
    enable = true;
    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>k" = "goto_prev";
        "<leader>j" = "goto_next";
      };
      lspBuf = {
        gd = "definition";
        gD = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        "<F2>" = "rename";
      };
    };
    servers = {
      bashls.enable = true;
      jsonls.enable = true;
      gopls.enable = true;
      nil-ls.enable = true;
      html.enable = true;
      cssls.enable = true;
      clangd.enable = true;
    };
  };

  lspkind = {
    enable = true;
    cmp = {
      enable = true;
      menu = {
        nvim_lsp = "[LSP]";
        nvim_lua = "[api]";
        path = "[path]";
        luasnip = "[snip]";
        buffer = "[buffer]";
        neorg = "[neorg]";
      };
    };
  };

  lsp-lines.enable = true;

  treesitter.enable = true;

  treesitter-context.enable = true;

  #cmp-nvim-lsp.enable = true;
  #cmp-buffer.enable = true;
  #cmp-path.enable = true;
  #cmp-cmdline.enable = true;
  #cmp_luasnip.enable = true;

  luasnip = {
    enable = true;
    extraConfig = {
      enable_autosnippets = true;
      store_selection_keys = true;
    };
  };

  cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      snippet.expand = ''
function(args)
  require('luasnip').lsp_expand(args.body)
end
'';
      mapping = {
        "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      sources = [
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "path";}
        {name = "buffer";}
      ];
    };
  };
}
