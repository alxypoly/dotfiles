
" --------------------------------------------------------
" General settings 
" --------------------------------------------------------

" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype on
filetype plugin on
filetype indent on

" --------------------------------------------------------
" Appearance settings 
" --------------------------------------------------------
syntax on

" colorscheme molokai
set bg=dark
set t_Co=256
let g:molokai_original = 0 
colorscheme molokai

" editor settings
set cursorline
set ruler								" line numbers and column the cursor is on
set number								" Show line numbering
set showcmd

set scrolloff=3							" Keep 3 lines below and above the cursor
set numberwidth=1						" Use 1 col + 1 space for numbers
set bs=2
set tabstop=4
set shiftwidth=4

" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M

" choose a coding friendly font (Ubuntu 11.10 comes with ubuntu mono font)
" set guifont=Monaco\ 8.6 


" --------------------------------------------------------
" Behaviour settings
" --------------------------------------------------------
set nocompatible
set expandtab
set autoindent
set cindent
set smartindent
set tabpagemax=20
set showmatch 

" enable some nice non-compliant vim features. 
set nocp

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

"Some vertipper :)
ab mkae make
ab tish this
ab tihs this

" --------------------------------------------------------
" Search settings 
" --------------------------------------------------------

" Remove marked matches after search command
nnoremap <CR> :nohlsearch<CR>/<BS><CR>

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"search rules
set ignorecase 
set smartcase


" --------------------------------------------------------
" Omni Completion settings 
" --------------------------------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


"let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteScope = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType python compiler pylint


" --------------------------------------------------------
" File Types handling
" --------------------------------------------------------
au BufNewFile,BufRead *.wiki setf Wikipedia

" dspm desc files
au BufRead,BufNewFile *.desc set filetype=dspm
au! Syntax newlang source $HOME/.vim/syntax/dspm.vim

" dspm metafile 
au BufRead,BufNewFile *.mfs set filetype=metafile
au! Syntax newlang source $HOME/.vim/syntax/metafile.vim

" scons files
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

" open office files
au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))

" delphi file system package
au BufReadCmd *.dfs call zip#Browse(expand("<amatch>"))

" makefile template files
au BufRead,BufNewFile *.Mf set filetype=make
