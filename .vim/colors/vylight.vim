"
" Vim colour file
"
" Maintainer:  Charalampos Emmanouilidis 
" Version:     1.0
"
" This colour file is meant for GUI use.
"

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vylight"


hi Normal        guifg=#424242  guibg=#f5f6f6
hi Title         guifg=black    guibg=white
hi Cursor                       guibg=#FF7311
hi LineNr        guifg=#bebebe  guibg=#f5f6f6
hi Visual                       guibg=#bbddff
hi NonText       guifg=#fafafa  guibg=#fafafa
hi StatusLine    guifg=#222222  guibg=#eeeeee  gui=none
hi StatusLineNC  guifg=#888888  guibg=#eeeeee  gui=none
hi VertSplit     guifg=#eeeeee  guibg=#eeeeee  gui=none
hi ModeMsg       guifg=black    guibg=#bbddff  gui=none
hi ErrorMsg      guifg=black    guibg=#ffbbbb  gui=none
hi Error         guifg=#bb3355  guibg=white    gui=none
hi Folded        guifg=#999999  guibg=#fafafa


" Vim 7.x specific
if version >= 700
  hi MatchParen                 guibg=#ccffdd  gui=none
  hi Pmenu       guifg=#60656f  guibg=#f0f5ff  gui=none
  hi PmenuSel    guifg=white    guibg=#3585ef  gui=bold
  hi PmenuSbar   guifg=#d0d5dd  guibg=#e0e5ee  gui=bold
  hi PmenuThumb  guifg=#e0e5ee  guibg=#c0c5dd  gui=bold
  hi Search                     guibg=#d75faf  gui=none
  hi IncSearch                  guibg=#d0d5dd  gui=none
  hi CursorLine                 guibg=#f1faff
  hi ColorColumn                guibg=#fafafa
endif

hi Comment       guifg=#bcbcbc  gui=italic
hi Todo          guifg=#d75faf  guibg=#e4e4e4 gui=italic
hi Operator      guifg=#585858  gui=none
hi Identifier    guifg=#585858  gui=bold
hi Statement     guifg=#424242  gui=bold
hi Type          guifg=#424242  gui=bold
hi Constant      guifg=#767676  gui=none
hi Conditional   guifg=#424242  gui=bold
hi Delimiter     guifg=#424242  gui=bold
hi PreProc       guifg=#424242  gui=bold
hi Special       guifg=#424242  gui=bold
hi Keyword       guifg=#424242  gui=bold


"
" Support for 256-color terminal
"
if &t_Co > 255
   hi String          ctermfg=238
   hi Conditional     ctermfg=239               cterm=bold
   hi Constant        ctermfg=243               cterm=none
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Folded          ctermfg=67  ctermbg=16
   hi Identifier      ctermfg=240             cterm=bold
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=169 ctermbg=16

   hi Keyword         ctermfg=238             cterm=bold
   hi Macro           ctermfg=238
   hi SpecialKey      ctermfg=238

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=240 cterm=none

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreProc         ctermfg=238 cterm=bold
   hi Search          ctermfg=16 ctermbg=169

   " marks column
   hi Special         ctermfg=238  cterm=bold

   hi Statement       ctermfg=238              cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi Structure       ctermfg=238
   hi Title           ctermfg=166
   hi Todo            ctermfg=169 ctermbg=254 cterm=bold
   hi Type            ctermfg=238              cterm=bold

   hi VertSplit       ctermfg=250 ctermbg=250
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=169
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=238 ctermbg=none
   hi Comment         ctermfg=250  ctermbg=none
   hi CursorLine                  ctermbg=none  cterm=none
   hi CursorColumn                ctermbg=none
   hi LineNr          ctermfg=250 ctermbg=none
   hi NonText         ctermfg=250 ctermbg=none
end


hi link Function        Normal
hi link Character       Constant
hi link String          Constant
hi link Boolean         Constant
hi link Number          Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Include         Normal
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
