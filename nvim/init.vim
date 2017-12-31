"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Extending vim functionality
Plug 'tpope/vim-sensible' " Provides base config
Plug 'w0rp/ale' " Asyncronous linting
Plug 'mileszs/ack.vim' " Use ack to grep project directory
Plug 'mattn/emmet-vim' " HTML expansion plugin, very useful
Plug 'bkad/CamelCaseMotion' " Camel Case based motions
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' } " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'tpope/vim-repeat' " make vim-commentary and vim-surround work with .
Plug 'tpope/vim-sleuth' " auto detect and set shiftwidth and expandtab (https://github.com/tpope/vim-sleuth)
Plug 'tpope/vim-unimpaired' " group of mappings for various next/previous commands
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events' " restore focusgained and focuslost autocommands
Plug 'wincent/vim-clipper' " shorcuts for clipper integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf install
Plug 'junegunn/fzf.vim' " fzf integration
Plug 'rbgrouleff/bclose.vim' " ranger.vim dep
Plug 'francoiscabrol/ranger.vim' " ranger intergration
Plug 'airblade/vim-gitgutter' " show git diff in gutter (https://github.com/airblade/vim-gitgutter)
Plug 'alvan/vim-closetag' " autoclose html tags
Plug 'wellle/targets.vim' " more text objects to operate on (https://github.com/wellle/targets.vim)
Plug 'ervandew/supertab' " use tab for all insert more completions (https://github.com/ervandew/supertab)


" Syntax highlighting / Themes / Indentation
Plug 'chriskempson/base16-vim' " colorschemes
" Plug 'yggdroot/indentline'
Plug 'nathanaelkane/vim-indent-guides' " Creates indent lines, makes code a bit easier to read
Plug 'sheerun/vim-polyglot' " One to rule them all, one to find them, one to bring them all and in the darkness bind them. (https://github.com/sheerun/vim-polyglot)
Plug 'ap/vim-css-color' " highlight colors

" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'othree/yajs.vim' " base javascript syntax
" Plug 'othree/javascript-libraries-syntax.vim' " syntax for js libs like jquery/vue
" Plug 'othree/es.next.syntax.vim' " es7+ syntax
" Plug 'tweekmonster/django-plus.vim', { 'for': ['html', 'htmldjango', 'python'] } " django python+html indent, completions, syntax
" Plug 'tmux-plugins/vim-tmux' " syntax, commentstring fix, and some extras

Plug 'hyshka/vim-uikit' " uikit class autocompletion

" My custom options
Plug 'hyshka/vim-options'

call plug#end()
"----------------------------------------------------------------------------------------------------------------------
