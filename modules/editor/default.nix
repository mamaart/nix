{ pkgs, ... }: 
{
  programs.nixvim = {
    enable = true; 
    plugins = import ./plugins.nix;
    keymaps = import ./keymaps.nix;

    extraPlugins = with pkgs.vimPlugins; [ 
      vim-go 
      lazygit-nvim
      aerial-nvim
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

    extraConfigLua = ''
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    '';

    extraConfigVim = ''
    augroup GolangMappings
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>
        autocmd FileType go nnoremap <buffer> <CR>t :w<CR>:GoTest<CR>
        autocmd FileType go nnoremap <buffer> <CR>c :w<CR>:GoCoverage<CR>
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>

        autocmd FileType go nnoremap <buffer> <leader>jj :w<CR>:GoAddTags<CR>

        autocmd FileType plantuml nnoremap <buffer> <CR> :w<CR>:!plantuml %<CR>
    augroup END
    '';

  };
}
