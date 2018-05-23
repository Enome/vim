" Colorscheme
packadd! onedark
syntax on
colorscheme onedark

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
nmap <Tab> :bn!<cr>
nmap <S-Tab> :bp!<cr>
map <C-c> :bd<cr>
map <F1> :UndotreeToggle<cr>
map <F3> :NERDTreeToggle<cr>
map ,n :NERDTreeFind<cr>
nnoremap <Space> za
