{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim_configurable
    nodejs # We want nodejs because of vim plugins
  ];

  home-manager.main.programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ale
      airline
      jedi-vim
      vim-gitgutter
      coc-nvim

      vim-elixir
      vim-pandoc
      vim-pandoc-syntax
      #vim-racket
      #vim-systemd-syntax
      haskell-vim
      #vim-crystal
      #vim-cmake-syntax
      elm-vim
      kotlin-vim

      wal-vim
    ];
    extraConfig = ''
      filetype plugin indent on
      syntax on
      set autoindent
      set smartindent

      set shiftwidth=0
      set tabstop=4
      set number
      set nocompatible
      syntax enable
      set wildmenu

      command Head sp %:r.h | res 10

      set splitbelow
      set splitright

      noremap <c-l> :tabnext<cr>
      noremap <c-h> :tabprevious<cr>

      set hidden
      set confirm

      au InsertLeave * call gitgutter#process_buffer(bufnr('''), 0)

      autocmd FileType haskell setlocal expandtab

      colorscheme wal

      let g:airline#extensions#tabline#enabled = 1

      " ignore case for insensitive search, and smartcase for sensitive when capitals are used
      set ignorecase
      set smartcase
    '';
  };
}
