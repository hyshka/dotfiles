" before ale is loaded
"let g:ale_completion_enabled = 1

" Section: Plugin init

call plug#begin('~/.vim/plugged')
    " foundation
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-sleuth' " unsure about this one
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'

    " tmux
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " ui
    Plug 'itchyny/lightline.vim'
    "Plug 'lifepillar/vim-solarized8'
    Plug 'sainnhe/everforest'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'lukas-reineke/indent-blankline.nvim'

    " navigation
    Plug 'francoiscabrol/ranger.vim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " language support
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'b0o/schemastore.nvim'

    " writing
    Plug 'dpelle/vim-languagetool'

    Plug 'HiPhish/nvim-ts-rainbow2'
    "Plug 'sheerun/vim-polyglot' " only useful for syntax unsupported by treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " TODO tree-sitter based comment strings
    "Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    Plug 'scrooloose/nerdcommenter'
    Plug 'mattn/emmet-vim'
    "Plug 'ahw/vim-pbcopy'
    Plug 'foosoft/vim-argwrap'
    Plug 'wellle/targets.vim'
    "Plug 'python-rope/ropevim'
    "Plug 'editorconfig/editorconfig-vim'
    "Plug 'preservim/tagbar'
    Plug 'folke/which-key.nvim'

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
call plug#end()

" Section: Options

" Configure persistent undo
set undodir=~/.vim/undodir
set undofile

" Store all backups and swapfiles in one spot
set backupdir=~/.vim/backupdir
set directory=~/.vim/swapdir

set clipboard+=unnamed " Always use the clipboard for all operations
set hidden " Hide buffer instead of unloading it.
set textwidth=80
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
set signcolumn=yes " always show
set showmatch " show matching bracket when inserted
set timeoutlen=300 " lower number for whichkey

" Section: Maps

" Set custom leader key
let mapleader = " "
let maplocalleader = " "

" Useful macros I use the most
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \n :setlocal number! relativenumber!<CR>:setlocal number? relativenumber?<CR>
nmap \x :cclose<CR> " close quickfix
nmap \h :syntax sync fromstart<CR> " refresh syntax highlighting
nmap <Leader>h :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>

" Correct next line jump within wrapped lines
nmap j gj
nmap k gk

" Don't interrupt visual mode indent
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
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Select the stuff I just pasted
nnoremap gV `[V`]

" Swap CTRL=] and g CTRL-] to make :tjump the default
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" Section: Autocommands

augroup vimrc
    autocmd!

    " Reload vimrc automatically when editing
    autocmd! BufWritePost ~/.vimrc source $MYVIMRC
    autocmd! BufWritePost .vimrc source $MYVIMRC " Editing in dotfiles repo

    " vue syntax always messes up
    "autocmd FileType vue syntax sync fromstart

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

    " Django templates
    autocmd BufNewFile,BufEnter,BufRead *templates/*.html setf htmldjango
    autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
    " Disable autowrapping in Django templates
    autocmd FileType htmldjango setlocal formatoptions-=t

    " Column highlighting
    autocmd BufNewFile,BufRead * call matchadd('ColorColumn', '\%81v', 80)
    autocmd BufNewFile,BufRead * call matchadd('Error', '\%121v', 100)

    " Folding
    " autocmd FileType javascript setlocal foldmethod=syntax
augroup END

" Section: Plugins

" telescope
nnoremap ; <cmd>Telescope buffers<CR>
nnoremap <Leader>ff <cmd>Telescope find_files<CR>
nnoremap <Leader>fF <cmd>Telescope git_files<CR>
nnoremap <Leader>fg <cmd>Telescope live_grep<CR>
nnoremap <Leader>fG <cmd>Telescope live_grep<CR>
nnoremap <Leader>fT <cmd>Telescope tags<CR>
nnoremap <Leader>ft <cmd>Telescope current_buffer_tags<CR>
nnoremap <Leader>fl <cmd>Telescope lsp_references<CR>

" ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>n :Ranger<CR>
nnoremap <leader>m :RangerWorkingDirectory<CR>

" ale
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 1
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_fix_on_save = 1
"function! DocFormatter(buffer) abort
"    return {
"    \   'command': 'docformatter --pre-summary-newline --wrap-summaries=0 -- -'
"    \}
"endfunction
"execute ale#fix#registry#Add('docformatter', 'DocFormatter', ['python'], 'docformatter for python')
"let g:ale_fixers = {
"    \'*': ['remove_trailing_lines', 'trim_whitespace'],
"    \'javascript': ['prettier'],
"    \'css': ['prettier'],
"    \'scss': ['prettier'],
"    \'vue': ['prettier'],
"    \'jsx': ['prettier'],
"    \'html': ['prettier'],
"    \'md': ['prettier'],
"    \'python': ['black', 'isort', 'docformatter'],
"    \}
"let g:ale_linters = {
"    \'javascript': ['eslint'],
"    \'css': ['stylelint'],
"    \'scss': ['stylelint'],
"    \'python': ['flake8'],
"    \}

" Lightline
" If this comes after we set our colorscheme than lightline won't properly set it's own colors.
let g:lightline = {
    \'colorscheme': 'everforest',
    \}
"let g:lightline.component_expand = {
"    \'linter_checking': 'lightline#ale#checking',
"    \'linter_warnings': 'lightline#ale#warnings',
"    \'linter_errors': 'lightline#ale#errors',
"    \'linter_ok': 'lightline#ale#ok',
"    \}
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

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light

"colorscheme solarized8
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 0
let g:everforest_sign_column_background = 'none'  " or grey
let g:everforest_ui_contrast = 'medium' " or low
let g:everforest_diagnostic_text_highlight = 0
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'  " or grey
colorscheme everforest

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
"let g:vue_disable_pre_processors=1

" vim-pbcopy
"let g:vim_pbcopy_local_cmd = "nc -w 0 localhost 41401"
"let g:vim_pbcopy_remote_cmd = "nc -w 0 localhost 41401"

" Argwrap
nnoremap <leader>W :ArgWrap<CR>
let g:argwrap_tail_comma = 1

" Tagbar
"nmap <Leader>b :TagbarToggle<CR>
"let g:tagbar_width = 60

" LanguageTool
let g:languagetool_cmd='/usr/bin/languagetool'
let g:languagetool_lang='en-CA'

" LSP
" TODO
" Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
" Required packages
" typescript: typescript-language-server
" python: ruff-lsp, pyright
" json: vscode-langservers-extracted
" yaml: yaml-language-server
" nix: rnix-lsp
lua <<EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.ruff_lsp.setup{}
require'lspconfig'.rnix.setup{}
require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF

" null-ls: eslint, black, semgrep, sqlfluff
" Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
" mypy requires: sudo pip install django-stubs django-stubs-ext
lua <<EOF
local null_ls = require("null-ls")
--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.tags,
        null_ls.builtins.diagnostics.eslint_d,
	--TODO mypy requires all project dependencies to be installed
	--null_ls.builtins.diagnostics.mypy,
        --null_ls.builtins.diagnostics.semgrep,
        --null_ls.builtins.diagnostics.sqlfluff.with({
        --    extra_args = { "--dialect", "mysql" },
        --}),
        null_ls.builtins.diagnostics.trail_space,
        --TODO docformatter
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.eslint_d,
        --null_ls.builtins.formatting.prettier,
        --null_ls.builtins.formatting.trim_whitespace,
    },
    --on_attach = function(client, bufnr)
    --    if client.supports_method("textDocument/formatting") then
    --        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --        vim.api.nvim_create_autocmd("BufWritePre", {
    --            group = augroup,
    --            buffer = bufnr,
    --            callback = function()
    --                vim.lsp.buf.format({ bufnr = bufnr })
    --            end,
    --        })
    --    end
    --end,
})
EOF

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "astro",
      "lua",
      "comment",
      "bash",
      "c",
      "cpp",
      "diff",
      "devicetree",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "graphql",
      "jsdoc",
      "markdown",
      "sql",
      "toml",
      "css",
      "vimdoc",
      "html",
      "htmldjango",
      "javascript",
      "jsdoc",
      "ledger",
      "json",
      "nix",
      "make",
      "python",
      "query",
      "regex",
      "scss",
      "svelte",
      "terraform",
      "todotxt",
      "typescript",
      "tsx",
      "vim",
      "vue",
      "yaml",
  },

  highlight = {
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
  },
  rainbow = {
    enable = true,
    query = {
        'rainbow-parens',
        html = 'rainbow-tags',
    },
    strategy = require('ts-rainbow').strategy.global,
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable  " Disable folding at startup.

" colorizer
lua require'colorizer'.setup()

" indent-blankline
highlight IndentBlanklineChar guifg=#e4e4e4 gui=nocombine
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_filetype = ['vim', 'python', 'html', 'htmldjango', 'javascript', 'jsx', 'vue', 'css', 'scss']

" which-key

lua << EOF
  require("which-key").setup {}
EOF
