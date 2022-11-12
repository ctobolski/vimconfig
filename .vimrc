let $VIM_HOME="${HOME}/.vim"
packloadall
packadd coc.nvim
packadd nerdtree
packadd nerdcommenter
packadd vim-airline
packadd vim-exchange
packadd vim-repeat
packadd vim-surround


colorscheme gruvbox
source $VIM_HOME/base-settings.vim
source $VIM_HOME/base-keymap.vim
source $VIM_HOME/plug-airline.vim
source $VIM_HOME/plug-fzf.vim
source $VIM_HOME/plug-coc.vim
source $VIM_HOME/plug-devicons.vim
source $VIM_HOME/plug-nerdcommenter.vim
source $VIM_HOME/plug-nerdtree.vim
