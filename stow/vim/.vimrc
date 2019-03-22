" neovim is always nocompatible but for Vim set nocompatible
if !has('nvim')
    set nocompatible
endif

autocmd! BufWritePost ~/.vimrc source $MYVIMRC
autocmd! BufWritePost .vimrc source $MYVIMRC " Editing in dotfiles repo

" These options don't work inside vim-options
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-unimpaired'
    Plug 'mileszs/ack.vim'
    Plug 'mattn/emmet-vim'
    Plug 'bkad/CamelCaseMotion'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'alvan/vim-closetag'
    Plug 'wellle/targets.vim'
    Plug 'foosoft/vim-argwrap'
    Plug 'ahw/vim-pbcopy'
    Plug 'tyru/caw.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'Yggdroot/indentLine'
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    " deoplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'Shougo/neco-syntax'
    " ranger
    Plug 'rbgrouleff/bclose.vim'
    Plug 'francoiscabrol/ranger.vim'
    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
    Plug 'junegunn/fzf.vim'
    " Personal
    Plug 'hyshka/vim-uikit'
    Plug 'hyshka/vim-options'
call plug#end()

let g:deoplete#enable_at_startup = 1

" Configure persistent undo
" Vim will save undo in file stored in .vim/undodir
set undodir=~/.vim/undodir
set undofile

" Surround shortcut to correctly wrap word 
nmap ysw ysiW
