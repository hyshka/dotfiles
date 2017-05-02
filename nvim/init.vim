"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Extending vim functionality
"-----
" Do I need these 2?
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons' " Dev icons, needs to be after ctrlp, nerdtree
"-----
Plug 'tpope/vim-sensible' " Provides base config
Plug 'mileszs/ack.vim' " Use ack to grep project directory
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'mattn/emmet-vim' " HTML expansion plugin, very useful
Plug 'bkad/CamelCaseMotion' " Camel Case based motions
"Plug 'tmhedberg/SimpylFold' " Folding for python
Plug 'tpope/vim-commentary' " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'tpope/vim-repeat' " make vim-commentary and vim-surround work with .
Plug 'milkypostman/vim-togglelist' " toggle the location and quickfix lists
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events' " restore focusgained and focuslost autocommands

" Syntax highlighting / Themes / Indentation
Plug 'chriskempson/base16-vim' " colorschemes
Plug 'yggdroot/indentline' " Creates indent lines, makes code a bit easier to read
Plug 'plasticboy/vim-markdown' " It's got some cool stuff but dammit.
Plug 'stephpy/vim-yaml'
Plug 'hdima/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'othree/yajs.vim' " base javascript syntax
Plug 'othree/javascript-libraries-syntax.vim' " syntax for js libs like jquery/vue
Plug 'othree/es.next.syntax.vim' " es7+ syntax
Plug 'gavocanov/vim-js-indent'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/colorizer' " highlight colors
Plug 'tweekmonster/django-plus.vim' " django python+html indent, completions, syntax
Plug 'tmux-plugins/vim-tmux' " syntax, commentstring fix, and some extras

" My custom options
Plug 'hyshka/vim-options'

call plug#end()
"----------------------------------------------------------------------------------------------------------------------
