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
filetype plugin indent on
" -----------------------------------------------------------------------------
" Appearance settings 
" -----------------------------------------------------------------------------

" Colorscheme solarized and font Monaco
syntax enable                  " Enable syntax highlighting.
set background=dark            " Change to light if you are on the other side
colorscheme solarized

" Editor settings
set ruler                      " Line numbers and column the cursor is on
set number                     " Show line numbering
set showcmd                    " Show information in bottom line
set cmdheight=2                " give more space for displaying messages
set scrolloff=3                " Keep 3 lines below and above the cursor
set numberwidth=1              " Use 1 col + 1 space for numbers
set tabstop=4                  " Set space characters when the tab key is pressed
" Try to see if filetype indent on functions correctly
"set shiftwidth=4               " Set 4 space characters for indentation

" GUI settings
set guitablabel=%N/\ %t\ %M    " tab labels show the filename without path(tail)
set guioptions-=T              " remove toolbar widget 
set guifont=Monaco\ 11         " My favorite font    

" -----------------------------------------------------------------------------
" Behaviour settings
" -----------------------------------------------------------------------------
set guicursor=a:blinkon0       " Switch off cursor blinking
set backspace=2                " Make backspace work like most other apps    
set expandtab                  " insert space characters when the tab is pressed
set tabpagemax=20              " Max tabs thah can be opened
set showmatch                  " Show matching Parenthesis, brackets and braces 
set nocompatible               " enable some nice non-compliant vim features.
set ttyfast                    " U got a fast terminal
set lazyredraw                 " to avoid scrolling problems
set novisualbell               " Stop anoying audio bell
set t_vb=

" Auto identation
set autoindent
set cindent
set smartindent

" --------------------------------------------------------
" Search settings 
" --------------------------------------------------------

" Remove marked matches after search command
nnoremap <CR> :nohlsearch<CR>/<BS><CR>
nnoremap <C-b> :!make<CR>

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"search rules
set ignorecase 
set smartcase

" --------------------------------------------------------
" File Types handling
" --------------------------------------------------------
au BufNewFile,BufRead *.wiki setf Wikipedia

" scons files
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

" open office files
au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))

" delphi file system package
au BufReadCmd *.dfs call tar#Browse(expand("<amatch>"))

" makefile template files
au BufRead,BufNewFile *.Mf set filetype=make

" Beautify C/C++ files
"function! BeautifyCPPFiles()
"    :silent !beautify.py '%:p' > /dev/null 2>&1
"    :e
"    :syntax on
"endfunction
"
"autocmd! bufwritepost *.cpp :call BeautifyCPPFiles()
"autocmd! bufwritepost *.hpp :call BeautifyCPPFiles()
"autocmd! bufwritepost *.c   :call BeautifyCPPFiles()
"autocmd! bufwritepost *.h   :call BeautifyCPPFiles()

" Setup omnicompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" --------------------------------------------------------
" Handy Stuff
" --------------------------------------------------------

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" --------------------------------------------------------
" Settings for Pythonistas
" --------------------------------------------------------

"Pathogen load
filetype off 
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on 

" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Skip errors and warnings
" W901 = method is too complex
let g:pymode_lint_ignore = "W901"

" Disable pylint checking every save 
let g:pymode_lint_write = 1 

" Load run code plugin 
let g:pymode_run = 1

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" disable automatic python folding
let g:pymode_folding=0 

" disable rope refactoring module, it's too slow
let g:pymode_rope = 0

" Disable g:pymode_rope_guess_project to make rope always create 
" .ropeproject in current dir.
let g:pymode_rope_guess_project = 0

" --------------------------------------------------------
" Hex Editing  
" --------------------------------------------------------

" Toggle between Hex and Bin with F8
noremap <F8> :call HexMe()<CR>

let $in_hex=0
function HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd -g 1
        let $in_hex=1
    endif
endfunction

noremap <F7> :%!xxd -r<CR>

" --------------------------------------------------------
" Testarea for Vim settings.  
" --------------------------------------------------------

" code completion using clang
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_exec="clang"
let g:clang_user_options = '|| exit 0'
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0

" always open quickfix window for grep results
autocmd QuickFixCmdPost *grep* cwindow

" change cursor stile if you are in edit mode
" (works for linux only!)
" TODO
