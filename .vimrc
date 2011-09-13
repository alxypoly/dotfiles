" set up tags
" set tags=tags
" set tags+=../tags

"not compatible to vi
set nocompatible

"set lazyredraw							" Don't repaint when scripts are running
set scrolloff=3							" Keep 3 lines below and above the cursor
set ruler								" line numbers and column the cursor is on
set number								" Show line numbering
set numberwidth=1						" Use 1 col + 1 space for numbers
set bs=2
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent
set tabpagemax=20
set showmatch 


" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

map ,cd :cd %:p:h<CR>

" Remove marked matches after search command
nnoremap <CR> :nohlsearch<CR>/<BS><CR>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
set nocp
filetype plugin on
filetype indent on
   
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"search rules
set ignorecase 
set smartcase

"Some vertipper :)
ab mkae make
ab tish this
ab tihs this

"Show commands
set showcmd
set number

"Extended Highlighting
set cursorline

"Omni/Word Completion
set completeopt=menuone

"let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteScope = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
"autocmd FileType python compiler pylint

" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M
set guifont=Monaco\ 8.6 

au BufRead,BufNewFile *.desc set filetype=dspm
au! Syntax newlang source $HOME/.vim/syntax/dspm.vim

au BufRead,BufNewFile *.mfs set filetype=metafile
au! Syntax newlang source $HOME/.vim/syntax/metafile.vim

autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
au BufReadCmd *.dfs call zip#Browse(expand("<amatch>"))

"colorscheme macvim
set bg=dark
set t_Co=256
let g:molokai_original = 0 
colorscheme molokai

