{ pkgs, ... }: 
{
  programs.nixvim = {
    enable = true; 
    plugins = import ./keymaps.nix;
    keymaps = import ./keymaps.nix;

    extraPlugins = with pkgs.vimPlugins; [ 
      vim-go 
      lazygit-nvim
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
