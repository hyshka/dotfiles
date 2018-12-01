"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Provides base config
Plug 'tpope/vim-sensible' 

" Use ack to grep project directory
Plug 'mileszs/ack.vim' 

" HTML expansion plugin, very useful
Plug 'mattn/emmet-vim' 

" Camel Case based motions
Plug 'bkad/CamelCaseMotion' 

" Git integration with vim
Plug 'tpope/vim-fugitive' 

" Helps manipulate characters surrounding text
Plug 'tpope/vim-surround' 

" make vim-commentary and vim-surround work with .
Plug 'tpope/vim-repeat' 

" auto detect and set shiftwidth and expandtab (https://github.com/tpope/vim-sleuth)
Plug 'tpope/vim-sleuth' 

" group of mappings for various next/previous commands
Plug 'tpope/vim-unimpaired' 

" Plug 'editorconfig/editorconfig-vim'

" restore focusgained and focuslost autocommands
Plug 'tmux-plugins/vim-tmux-focus-events' 

" fzf install + integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

" ranger.vim dependency + integration
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

 " autoclose html tags
Plug 'alvan/vim-closetag'

" more text objects to operate on (https://github.com/wellle/targets.vim)
Plug 'wellle/targets.vim' 

" use tab for all insert more completions (https://github.com/ervandew/supertab)
Plug 'ervandew/supertab' 

" extra tools for (un)wrapping lists and objects
Plug 'foosoft/vim-argwrap' 

" netcat style copy-paste
Plug 'ahw/vim-pbcopy' 

" context and language-aware commentstrings (only one that works with vue templates)
Plug 'tomtom/tcomment_vim'

" help map esc to jk/kj with super-low latency
Plug 'zhou13/vim-easyescape' 

" One to rule them all, one to find them, one to bring them all and in the darkness bind them. (https://github.com/sheerun/vim-polyglot)
Plug 'sheerun/vim-polyglot' 

" status bars
Plug 'itchyny/lightline.vim'

" colorscheme
Plug 'altercation/vim-colors-solarized'

" indent lines trial
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

" class outline viewer
" TODO: WIP
" Plug 'majutsushi/tagbar'

" presentation software (slides)
Plug "sotte/presenting.vim"

" uikit class autocompletion
Plug 'hyshka/vim-uikit'

" all my settings
Plug 'hyshka/vim-options'

call plug#end()
"----------------------------------------------------------------------------------------------------------------------
