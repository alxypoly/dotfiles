" OmniCppComplete initialization
call omni#cpp#complete#Init()

" set tags+=$HOME/.vim/tags/utility.tags
set tags+=$HOME/.vim/tags/dspm.tags
set tags+=/home/m5/sw/utility/Current/tags
map <C-F12> :execute "!ctags -a -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ " . getcwd()<CR>"


" Build sequence
nmap make <ESC>:wall!<CR><ESC>:mks!<CR><ESC>:!ctags -R .<CR><ESC>:!make<CR>
" " MS VS Build sequence
nmap <C-S-B> <ESC>:wall!<CR><ESC>:mks!<CR><ESC>:!ctags -R.<CR><ESC>:!make<CR>

" Comment a method
" 1. Mark current line into buffer f (mf)
" 2. jump to the beginning of the line (0)
" 3. copy current line without the ending CR into the buffer f(fy$)
" 3. go UP(<UP>)
" 4. execute DoxyCppFunction (:DoxyCppFunction<CR><ESC>)
" 5. paste content of buffer f into current position ("fp)
" 6. jump back to the position where we started the command execution (`f)
nmap cf <ESC>mf0"fy$<UP>:DoxyCppFunction<CR><ESC>"fp`f

" Comment a header file, and remove all .h produced by the doxygen-MACRO $FILE$ (but skip the header comment, ending at line 19)
nmap ch <ESC>:DoxyCppFILEHeaderINCLUDE<CR><ESC>:30,$s/\.h//g<CR>

" Comment a cpp file, and remove all .cpp produced by the doxygen-MACRO $FILE$ (but skip the header comment, ending at line 19)
nmap cp <ESC>:DoxyCppFILEHeaderPROG<CR><ESC>:30,$s/\.cpp//g<CR>

" Comment block, short
nmap cbs <ESC><UP>:DoxyCppBlockShort<CR>

