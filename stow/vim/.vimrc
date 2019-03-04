"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Extending vim functionality
Plug 'tpope/vim-sensible' " Provides base config
Plug 'mileszs/ack.vim' " Use ack to grep project directory
Plug 'bkad/CamelCaseMotion' " Camel Case based motions
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'tpope/vim-repeat' " make vim-commentary and vim-surround work with .
Plug 'tpope/vim-sleuth' " auto detect and set shiftwidth and expandtab (https://github.com/tpope/vim-sleuth)
Plug 'tpope/vim-unimpaired' " group of mappings for various next/previous commands
Plug 'tmux-plugins/vim-tmux-focus-events' " restore focusgained and focuslost autocommands
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf install
Plug 'junegunn/fzf.vim' " fzf integration
Plug 'rbgrouleff/bclose.vim' " ranger.vim dep
Plug 'francoiscabrol/ranger.vim' " ranger intergration
Plug 'wellle/targets.vim' " more text objects to operate on (https://github.com/wellle/targets.vim)
Plug 'foosoft/vim-argwrap' " extra tools for (un)wrapping lists and objects
Plug 'ahw/vim-pbcopy' " netcat style copy-paste
Plug 'tomtom/tcomment_vim'
Plug 'zhou13/vim-easyescape' " help map esc to jk/kj with super-low latency
Plug 'Yggdroot/indentLine' " indent lines

" Syntax highlighting / Themes / Indentation
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot' " One to rule them all, one to find them, one to bring them all and in the darkness bind them. (https://github.com/sheerun/vim-polyglot)
Plug 'itchyny/lightline.vim'

" My plugins
Plug 'hyshka/vim-options'

call plug#end()
"----------------------------------------------------------------------------------------------------------------------
