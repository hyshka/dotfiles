"----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" big ticket items
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'ryanoasis/vim-devicons' " Dev icons, needs to be after ctrlp, nerdtree, etc.

" General Plugins
Plug 'milkypostman/vim-togglelist' " toggle the location list
Plug 'yggdroot/indentline' " Creates indent lines, makes code a bit easier to read
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'

" colortheme
Plug 'chriskempson/base16-vim'

" tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'

" django
Plug 'tweekmonster/django-plus.vim'

" frontend
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'chrisbra/colorizer' " color highlighting

" tim pope
Plug 'tpope/vim-sensible' " Provides base config

" vim-surround: s is a text-object for delimiters; ss linewise
" ys to add surround
Plug 'tpope/vim-surround'

" vim-commentary: gc is an operator to toggle comments; gcc linewise
Plug 'tpope/vim-commentary'

" vim-repeat: make vim-commentary and vim-surround work with .
Plug 'tpope/vim-repeat'

" Git integration with vim
Plug 'tpope/vim-fugitive'

" my settings
Plug 'hyshka/vim-options'

" old
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Shougo/unite.vim' " Provides yank history and buffer switching
"Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Vimproc because fucking unite needs it
"Plug 'Shougo/neoyank.vim' " Provides yank history for unite
"Plug 'jamessan/vim-gnupg' " Loads encrypted files by asking for password
"Plug 'rizzatti/dash.vim' " Dash Functionality
"Plug 'bkad/CamelCaseMotion' " Camel Case based motions
"Plug 'tmhedberg/SimpylFold' " Folding for python

" Deoplete
"function! DoRemote(arg)
"  UpdateRemotePlugins
"endfunction
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'zchee/deoplete-jedi'

" Markdown Plugins
"Plug 'plasticboy/vim-markdown' " Syntax highlighting

" YAML Plugins
"Plug 'stephpy/vim-yaml' " Syntax highlighting

" Python Plugins
"Plug 'hdima/python-syntax'

" Javascript Plugin
"Plug 'elzr/vim-json'
"Plug 'othree/yajs.vim'
"Plug 'gavocanov/vim-js-indent'
"Plug 'sidorares/node-vim-debugger'
"Plug 'digitaltoad/vim-pug'

" Add plugins to &runtimepath
call plug#end()




"----------------------------------------------------------------------------------------------------------------------
" Neovim/Local vim options
"----------------------------------------------------------------------------------------------------------------------
set backupdir^=~/.config/nvim/nvim-files/backups/
set directory=~/.config/nvim/nvim-files/swaps/



" Making ctrl-p better and faster
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'
endif
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = './.vimcache/ctrlp'
let g:ctrlp_map = '<Space>p'
"let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:syntastic_python_python_exec = '/usr/bin/python3'

"function! SaveSession()
  ":mksession! ./.vimcache/session.vim
  ":echo 'Session Saved!'
"endfunction
"
"function! RestoreSession()
  ":source ./.vimcache/session.vim
"endfunction

"nnoremap <leader>ee :call SaveSession()<CR>
"nnoremap <leader>er :call RestoreSession()<CR>
"function! RenameTab()
"  call inputsave()
"  let term = input('Tabname: ')
"  call inputrestore()
"  if !empty(term)
"    execute ":TabooRename " . term
"  endif
"endfunction
"
"nnoremap <leader>r :call RenameTab()<CR>

" Last tab command
"let g:lasttab = 1
"nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()

" PHP files are using tabs, expandtab is not found?
"autocmd FileType php set noexpandtab!
