" Colorscheme
packadd! onedark.vim
syntax on

" Indents
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
filetype plugin indent on

"Numbers
set number

"Search
set hlsearch
hi clear Search
hi Search cterm=underline ctermbg=None

"Undo
set undofile                    " Save undo's after file closes
set undodir=$HOME/.vim/.undodir " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " Number of lines to save for undo

"Backups
set backupcopy=yes              " This is required to make watchers work
set directory=$HOME/.vim/.swaps " Where to save undo histories

"Folds
set viewdir=$HOME/.vim/.viewdir

"View sessions (:h views-sessions)
"-> Jump to last position when reopening a file
"-> Remember folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"Airline
let g:airline#extensions#tabline#enabled=1 "Show buffers when one file is open

"Git Gutter
set updatetime=1000                 
let g:indentLine_noConcealCursor=""
let g:vim_json_syntax_conceal=0     "Requires elzr/vim-json plugin

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"ctrlp
let g:ctrlp_custom_ignore = 'node_modules'

"Shortcuts
let mapleader =","
nmap <Tab> :bn!<cr>
nmap <S-Tab> :bp!<cr>
map <C-c> :bd<cr>
map <F1> :UndotreeToggle<cr>
map <F3> :NERDTreeToggle<cr>
map ,n :NERDTreeFind<cr>
nnoremap <Space> za

" Close tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Formatting
nmap <Leader>f <Plug>(PrettierAsync)
let g:prettier#autoformat = 0
autocmd FileType python map <buffer> <leader>f :%! black -q --py36 -<cr>

" backspace stopped working :(
set backspace=indent,eol,start

" vim-rooter
let g:rooter_patterns = ['package.json', '.vimrc']
let g:rooter_manual_only = 1

function! CallInRoot(...)
  let oldpath = getcwd()
  let root = FindRootDirectory()
  execute "cd " . root
  execute a:000[0]
  execute "cd " . oldpath
endfunction

command! -nargs=? CallInRoot call CallInRoot(<f-args>)

autocmd FileType javascript map <leader>d :CallInRoot :!madge . --depends %<cr>

"Colorscheme

"Use 24-bit (true-color) mode.
"More information about true-color mode in tmux:
"* http://sunaku.github.io/tmux-24bit-color.html#usage
"* https://github.com/tmux/tmux/issues/34
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
if (has("termguicolors"))
  if !empty($TMUX)
    "Set Vim-specific sequences for RGB colors; only seems to be needed for Vim 8 running inside tmux with $TERM=tmux
    "Found at < https://github.com/vim/vim/issues/993#issuecomment-255651605 >
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

"onedark.vim override: Don't set a background color when running in a terminal;
"just use the terminal's background color
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7"}
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) "No `bg` setting
  augroup END
endif

let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
colorscheme onedark
