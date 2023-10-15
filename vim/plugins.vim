let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  " Style
  Plug 'morhetz/gruvbox'
  " Config
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'lambdalisue/fern.vim' " nerdtree alternative
  " Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  

call plug#end()