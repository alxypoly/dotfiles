" Vim
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.

" -----------------------------------------------------------------------------
" Path/File settings 
" -----------------------------------------------------------------------------
 
 " always add the current file's directory to the path if not already there
 autocmd BufRead *
       \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
       \ exec "set path-=".s:tempPath |
       \ exec "set path+=".s:tempPath
 
 " Enable file type detection and language-dependent indenting
 filetype plugin indent on

 " Wolfgang's autocommpletion and search
 set path=.\ ../INCLUDE\ ../../INCLUDE\ /home/m5/sw/utility/17.09/include\ /home/m5/sw/nls/20.24/include\ /usr/include,
 set tags=tags\ ../tags\ ../../tags\ ../../../tags\ ./DOCU/tags\ ../DOCU/tags\ ../../DOCU/tags\ ../../../DOCU/tags

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
 set shiftwidth=4               " Set 4 space characters for indentation
 
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

" Stop anoying audio bell
 set noerrorbells visualbell t_vb=
 autocmd GUIEnter * set visualbell t_vb=
 
 " Auto identation
 set autoindent
 set cindent
 set smartindent
  
" -----------------------------------------------------------------------------
" Search settings 
" -----------------------------------------------------------------------------
 
 " Remove marked matches after search command
 nnoremap <CR> :nohlsearch<CR>/<BS><CR>
 nnoremap <C-b> :!make<CR>
 
 " Highlight search terms...
 set hlsearch 
 set incsearch " ...dynamically as they are typed.
 
 "search rules
 set ignorecase                                                                            
 set smartcase
 
" -----------------------------------------------------------------------------
" Handy Stuff
" -----------------------------------------------------------------------------
 
 " Initial size of window
 set lines=50 columns=85  

 " Resize splits when the window is resized
 au VimResized * exe "normal! \<c-w>="     

 " Some mistypes
 ab mkae make
 ab tish this
 ab tihs this

" -----------------------------------------------------------------------------
" Mouse Settings 
" -----------------------------------------------------------------------------
 set mouse=a                    " Enable mouse action

 " Only do this for Vim version 5.0 and later.
 if version >= 500
     set selectmode=mouse       " On mouse clicks switch to 'select-mode'
     set mousehide              " Hide the mouse pointer while typing
 endif

" -----------------------------------------------------------------------------
" Key Mapping 
" -----------------------------------------------------------------------------

 " Map 'Shift-Down' to '^V^WDown^W_' (Window_Down + Increase to maximum)
 map <C-Down> <Down>_
 map! <C-Down> <Down>_
 
 " Map 'Shift-Up' to '^V^WUp^W_' (Window_Up + Increase to maximum)
 map <C-Up> <Up>_
 map! <C-Up> <Up>_
 
 " Map Find_Tag key from '^]' to '^Right'
 map <C-Right> 
 map <S-Right> 
 
 " Map Return_From_Tag key from '^T' to '^Left' 
 map <C-Left> 
 map <S-Left> c
 
 " Map 'F8' to search for all occurances of the work under the cursor
 " relative to the current directory.
 map <F8> :split<CR>:execute "grep " expand("<cword>") " ./*.[ch] ./*/*.[ch] ../*.[ch] ../*/*.[ch] ./*.cpp ./*/*.cpp ../*.cpp ../*/*.cpp"<CR>
 
 " Map 'F9' to the command 'Display Previous Item' from 'F9' output list
 map <F9> :cp<CR>
 map! <F9> :cp<CR>
 
 " Map 'F10' to the command 'Display Next Item' from 'F10' output list
 map <F10> :cn<CR>
 map! <F10> :cn<CR>

 map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" -----------------------------------------------------------------------------
" File Types handling
" -----------------------------------------------------------------------------
 au BufNewFile,BufRead *.wiki setf Wikipedia
 
 " open office files
 au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))                            
 au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
 
 " makefile template files
 au BufRead,BufNewFile *.Mf set filetype=make

" -----------------------------------------------------------------------------
" Hex Editing  
" -----------------------------------------------------------------------------
    
 " Toggle between Hex and Bin with F11 F12
 noremap <F12> :call MyHex()<CR>
         
 let $in_hex=0
 function MyHex()
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
 
 noremap <F11> :%!xxd -r<CR>

" -----------------------------------------------------------------------------
" Testarea for Vim settings.  
" -----------------------------------------------------------------------------
 " TODO

 " code completion using clang
 "let g:clang_auto_select=1
 "let g:clang_complete_auto=1
 "let g:clang_complete_copen=1
 "let g:clang_hl_errors=1
 "let g:clang_periodic_quickfix=0
 "let g:clang_snippets=1
 "let g:clang_snippets_engine="clang_complete"
 "let g:clang_conceal_snippets=1
 "let g:clang_exec="clang"
 "let g:clang_user_options = '|| exit 0'
 "let g:clang_auto_user_options="path, .clang_complete"
 "let g:clang_use_library=1
 "let g:clang_library_path="/usr/lib/"
 "let g:clang_sort_algo="priority"
 "let g:clang_complete_macros=1
 "let g:clang_complete_patterns=0
 
 " always open quickfix window for grep results
 "autocmd QuickFixCmdPost *grep* cwindow

 " TODO
" -----------------------------------------------------------------------------
" Settings for Pythonistas
" -----------------------------------------------------------------------------
 
 "Pathogen load
" filetype off 
" call pathogen#infect()
" call pathogen#helptags()
" 
" filetype plugin indent on
" syntax on 
" 
" " Load pylint code plugin 
" let g:pymode_lint = 1
" 
" " Switch pylint, pyflakes, pep8, mccabe code-checkers
  " Can have multiply values "pep8,pyflakes,mcccabe"
" let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
" 
" " Skip errors and warnings
" " W901 = method is too complex
" let g:pymode_lint_ignore = "W901"
" 
" " Disable pylint checking every save 
" let g:pymode_lint_write = 1 
" 
" " Load run code plugin 
" let g:pymode_run = 1
" 
" " Hold cursor in current window
" " when quickfix is open
" let g:pymode_lint_hold = 0
" 
" " Place error signs
" let g:pymode_lint_signs = 1
" 
" " disable automatic python folding
" let g:pymode_folding=0 
" 
" " disable rope refactoring module, it's too slow
" let g:pymode_rope = 0
" 
" " Disable g:pymode_rope_guess_project to make rope always create 
" " .ropeproject in current dir.
" let g:pymode_rope_guess_project = 0                                                       
