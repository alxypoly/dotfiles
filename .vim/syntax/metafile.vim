" Vim syntax file
" Language:	metafile description file
" Maintainer:	Charalampos Emmanouilidis <charalampos.emmanouilidis@philips.com>
" URL:		XXX
" Last Change:	Fri Dec 05 2008


" Place this file as ~/.vim/syntax/metafile.vim
"
" Then add the following lines to ~/.vimrc
"
" au BufRead,BufNewFile *.desc set filetype=metafile
" au! Syntax newlang source $HOME/.vim/syntax/metafile.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif



syn keyword metafileFunction        Add Or Inc Dec LoadI32 LoadI16 ILoadU8 LoadU8 LoadU16 ILoadU16 PaintLine FillRect
syn keyword metafileKey             const alias next if ifbit then done Done for downto return goto Goto Gosub 
syn keyword metafileInt             LegacyColor p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 rZero r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 fix0 fix1 fix2 fix3 fix4


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_metafile_syn_inits")
	if version < 508
		let did_metafile_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink metafileFunction		    Function
    HiLink metafileKey              Keyword
    HiLink metafileInt              Number

	delcommand HiLink
endif

let b:current_syntax = "metafile"
