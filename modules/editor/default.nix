{ pkgs, ... }: 
{
  programs.nixvim = {
    enable = true; 

    keymaps = [
      {
        key = "<leader>gg";
        action = ":LazyGit<CR>";
	options = {
	  silent = true;
	};
      }
      {
        key = "<c-k>";
        action = ":wincmd k<CR>";
	options = {
	  silent = true;
	};
      }
      {
        key = "<c-j>";
        action = ":wincmd j<CR>";
	options = {
	  silent = true;
	};
      }
      {
        key = "<c-h>";
        action = ":wincmd h<CR>";
	options = {
	  silent = true;
	};
      }
      {
        key = "<c-l>";
        action = ":wincmd l<CR>";
	options = {
	  silent = true;
	};
      }
      {
        key = "<leader>n";
        action = ":Neotree action=focus reveal toggle<CR>";
      }
      {
        key = "<leader>x";
        action = ":BufferClose<CR>";
      }
      {
        key = "<leader>tt";
        action = ":TroubleToggle<CR>";
      }
    ];

    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      updatetime = 100;

      incsearch = true;

      ignorecase = true;
      smartcase = true;
      undofile = true;
      swapfile = false;

      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.dracula.enable = true;


    opts.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
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
      treesitter.enable = true;
      treesitter-context.enable = true;
      luasnip.enable = true;
      markdown-preview.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      nvim-autopairs.enable = true;
      surround.enable = true;
      commentary.enable = true;

      cmp = {
        enable = true;
        settings = {
          snippet.expand = "luasnip";
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

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;
      cmp_luasnip.enable = true;

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
    };

    extraPlugins = with pkgs.vimPlugins; [ 
      vim-go 
      lazygit-nvim
    ];

    extraConfigVim = ''
    augroup GolangMappings
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>
        autocmd FileType go nnoremap <buffer> <CR>t :w<CR>:GoTest<CR>
        autocmd FileType go nnoremap <buffer> <CR>c :w<CR>:GoCoverage<CR>
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>

        autocmd FileType go nnoremap <buffer> <leader>jj :w<CR>:GoAddTags<CR>
    augroup END
    '';

  };
}
