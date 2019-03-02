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

" extra tools for (un)wrapping lists and objects
Plug 'foosoft/vim-argwrap'

" netcat style copy-paste
Plug 'ahw/vim-pbcopy'

" context and language-aware commentstrings (only one that works with vue templates)
Plug 'tomtom/tcomment_vim'

" One to rule them all, one to find them, one to bring them all and in the darkness bind them. (https://github.com/sheerun/vim-polyglot)
Plug 'sheerun/vim-polyglot'

" status bars
Plug 'itchyny/lightline.vim'

" colorscheme
Plug 'altercation/vim-colors-solarized'

" indent lines
Plug 'Yggdroot/indentLine'

" class outline viewer
Plug 'majutsushi/tagbar'

" presentation software (slides)
Plug 'sotte/presenting.vim'

" Code completion
" Plug 'Valloric/YouCompleteMe'

" Linting, Fixing, and Code completion
Plug 'w0rp/ale'

" uikit class autocompletion
Plug 'hyshka/vim-uikit'

" all my settings
Plug 'hyshka/vim-options'

call plug#end()

" These options don't work inside vim-options
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
"----------------------------------------------------------------------------------------------------------------------
