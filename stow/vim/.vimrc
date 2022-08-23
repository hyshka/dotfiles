" neovim is always nocompatible but for Vim set nocompatible
if !has('nvim')
    set nocompatible
endif

" before ale is loaded
let g:ale_completion_enabled = 1

" Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    Plug 'lifepillar/vim-solarized8'
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/nerdcommenter'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-sleuth'
    Plug 'ahw/vim-pbcopy'
    Plug 'foosoft/vim-argwrap'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'
    "Plug 'python-rope/ropevim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ternjs/tern_for_vim'
    Plug 'preservim/tagbar'
    Plug 'dpelle/vim-languagetool'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'lukas-reineke/indent-blankline.nvim'

    " TODO: learn more about native vim completion before trying deoplete
    " if has('nvim')
    "     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "     Plug 'Shougo/deoplete.nvim'
    "     Plug 'roxma/nvim-yarp'
    "     Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    " Plug 'Shougo/neco-syntax'
    " Plug 'ervandew/supertab'
    " Plug 'hyshka/vim-uikit'

call plug#end()

" Options

" Configure persistent undo
set undodir=~/.vim/undodir
set undofile

" Store all backups and swapfiles in one spot
set backupdir=~/.vim/backupdir
set directory=~/.vim/swapdir

set hidden " Hide buffer instead of unloading it.
set noshowmode " Don't need this anymore due to lightline plugin

" Always use the clipboard for all operations
set clipboard+=unnamed

set textwidth=80
set autoread " Detect file changes on disk
set conceallevel=1 " Uses pretty characters
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter
set number " show line numbers
set relativenumber " Use relative numbers
set suffixes+=.pyc " also ignore these in filename completion
set splitright " vertical splits go right
set splitbelow " horizontal splits go below
set wildmode=longest,list " Complete command line on longest substring, then list alternatives
set wildignore+=*/cache,*/vendor,*/env,*.pyc,*/venv,*/__pycache__,*/.git,*/node_modules " Ignore in tab-completion
set autowrite " write file before changing buffer with some commands
set formatoptions=tcqjn1 " t - autowrap normal text
                         " c - autowrap comments
                         " q - gq formats comments
                         " j - remove comment leader when joining
                         " n - autowrap lists
                         " 1 - break _before_ single-letter words
set shell=bash " use bash in terminal mode
set signcolumn=yes " always show
set showmatch " show matching bracket when inserted
set syntax=off " disable syntax highlighting
set tags=./tags;,tags " search for tags file recursively up

" Maps

" Set custom leader key
let mapleader = ","
let maplocalleader = ","

" Useful macros I use the most
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \n :setlocal number! relativenumber!<CR>:setlocal number? relativenumber?<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \q :nohlsearch<CR>
nmap \l :setlocal list!<CR>:setlocal list?<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \x :cclose<CR> " close quickfix
nmap \h :syntax sync fromstart<CR> " refresh syntax highlighting

" Correct next line jump within wrapped lines
nmap j gj
nmap k gk

" Don't interrupt v-mode due indent
vnoremap < <gv
vnoremap > >gv

" Edit last buffer
nmap <C-e> :e#<CR>

" Super fast window movement shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> <C-w><C-]>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Select the stuff I just pasted
nnoremap gV `[V`]

" Swap CTRL=] and g CTRL-] to make :tjump the default
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" Autocommands

augroup vimrc
    autocmd!

    " Reload vimrc automatically when editing
    autocmd! BufWritePost ~/.vimrc source $MYVIMRC
    autocmd! BufWritePost .vimrc source $MYVIMRC " Editing in dotfiles repo

    " vue syntax always messes up
    autocmd FileType vue syntax sync fromstart

    " Debugging helpers
    autocmd BufEnter *.py iabbr xxx print("XXX",
    autocmd BufEnter *.py iabbr yyy print("YYY",
    autocmd BufEnter *.py iabbr zzz print("ZZZ",
    autocmd BufEnter *.js iabbr xxx console.log("XXX",
    autocmd BufEnter *.js iabbr yyy console.log("YYY",
    autocmd BufEnter *.js iabbr zzz console.log("ZZZ",
    autocmd BufEnter *.jsx iabbr xxx console.log("XXX",
    autocmd BufEnter *.jsx iabbr yyy console.log("YYY",
    autocmd BufEnter *.jsx iabbr zzz console.log("ZZZ",
    autocmd BufEnter *.vue iabbr xxx console.log("XXX",
    autocmd BufEnter *.vue iabbr yyy console.log("YYY",
    autocmd BufEnter *.vue iabbr zzz console.log("ZZZ",

    " Neomutt composition
    autocmd BufRead /tmp/neomutt-* set textwidth=72

    " Django templates
    autocmd BufNewFile,BufEnter,BufRead *templates/*.html setf htmldjango
    autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
    " Disable autowrapping in Django templates
    autocmd FileType htmldjango setlocal formatoptions-=t

    " Column highlighting
    autocmd BufNewFile,BufRead * call matchadd('ColorColumn', '\%81v', 80)
    autocmd BufNewFile,BufRead * call matchadd('Error', '\%121v', 100)

    " Folding
    " au FileType javascript setlocal foldmethod=syntax
augroup END

" Plugins

" telescope
nnoremap ; <cmd>Telescope buffers<CR>
nnoremap <Leader>f <cmd>Telescope find_files<CR>
nnoremap <Leader>F <cmd>Telescope git_files<CR>
nnoremap <Leader>s <cmd>Telescope live_grep<CR>
nnoremap <Leader>T <cmd>Telescope tags<CR>
nnoremap <Leader>t <cmd>Telescope current_buffer_tags<CR>
nnoremap <Leader>l <cmd>Telescope lsp_references<CR>

" ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>n :Ranger<CR>
nnoremap <leader>m :RangerWorkingDirectory<CR>

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
function! DocFormatter(buffer) abort
    return {
    \   'command': 'docformatter --pre-summary-newline --wrap-summaries=0 -- -'
    \}
endfunction
execute ale#fix#registry#Add('docformatter', 'DocFormatter', ['python'], 'docformatter for python')
let g:ale_fixers = {
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \'javascript': ['prettier'],
    \'css': ['prettier'],
    \'scss': ['prettier'],
    \'vue': ['prettier'],
    \'jsx': ['prettier'],
    \'html': ['prettier'],
    \'md': ['prettier'],
    \'python': ['black', 'isort', 'docformatter'],
    \}
let g:ale_linters = {
    \'javascript': ['eslint'],
    \'css': ['stylelint'],
    \'scss': ['stylelint'],
    \'python': ['flake8'],
    \}

" Lightline
" If this comes after we set our colorscheme than lightline won't properly set it's own colors.
let g:lightline = {
    \'colorscheme': 'solarized',
    \}
let g:lightline.component_expand = {
    \'linter_checking': 'lightline#ale#checking',
    \'linter_warnings': 'lightline#ale#warnings',
    \'linter_errors': 'lightline#ale#errors',
    \'linter_ok': 'lightline#ale#ok',
    \}
let g:lightline.component_type = {
    \'linter_checking': 'left',
    \'linter_warnings': 'warning',
    \'linter_errors': 'error',
    \'linter_ok': 'left',
    \}
let g:lightline.active = {
    \'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo', 'percent', 'fileformat', 'fileencoding', 'filetype' ]]
    \}
let g:lightline.component = {
    \'filename': "%{expand('%:p:h:t')}/%t"
    \}

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
if (has("termguicolors"))
    set termguicolors
endif
set background=light
colorscheme solarized8

" deoplete
" let g:deoplete#enable_at_startup = 1

" Surround shortcut to correctly wrap word
nmap ysw ysiW

" nerdcommenter support for vue files
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" Speed up vim-vue syntax highlighting, ignores preprocessors
let g:vue_disable_pre_processors=1

" vim-pbcopy
let g:vim_pbcopy_local_cmd = "nc -w 0 localhost 41401"
let g:vim_pbcopy_remote_cmd = "nc -w 0 localhost 41401"

" Argwrap
nnoremap <leader>W :ArgWrap<CR>
let g:argwrap_tail_comma = 1

" Tagbar
nmap <Leader>b :TagbarToggle<CR>
let g:tagbar_width = 60

" LanguageTool
let g:languagetool_cmd='/usr/bin/languagetool'
let g:languagetool_lang='en-CA'

" LSP
" TODO

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "comment", "bash", "css", "help", "html", "javascript", "json", "make", "python", "regex", "scss", "typescript", "vim",
  "vue", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" colorizer
lua require'colorizer'.setup()

" indent-blankline
highlight IndentBlanklineChar guifg=#e4e4e4 gui=nocombine
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_filetype = ['vim', 'python', 'html', 'htmldjango', 'javascript', 'jsx', 'vue', 'css', 'scss']
