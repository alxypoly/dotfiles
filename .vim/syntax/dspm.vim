" Vim syntax file
" Language:	dspm description file
" Maintainer:	Charalampos Emmanouilidis <charalampos.emmanouilidis@philips.com>
" URL:		XXX
" Last Change:	Fri Dec 05 2008


" Place this file as ~/.vim/syntax/dspm.vim
"
" Then add the following lines to ~/.vimrc
"
" au BufRead,BufNewFile *.desc set filetype=dspm
" au! Syntax newlang source $HOME/.vim/syntax/dspm.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif



syn keyword dspmFunction        GET_HANDLE SET_HANDLE ARRAY ARRAY_MEMBER MEMBER SET GET UPDATE MEMBER STANDARD VARSIZE VARSIZE_GET VARSIZE_SET COPY VARSIZE_MEMBER UPDATE_ARRAY_FULL_COMP DEFAULT_ADDRESS_AND_ID DEFAULT REFERENCE HANDLE

syn keyword dspmClass           class managed property end remote method event
syn keyword dspmKey             factory classid include cppinclude constructor create read write type comment parameter
syn region  dspmString          matchgroup=dspmStringDelimiter start="\"" end="\"" skip="\\\\\|\\\""
syn keyword dspmInt             SaVisualGrid16 ScaleRangeSpec16 SaCalData16 i_16 i_32 u_16 u_32 MdilTextId MDIL_FLOAT Color 

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dspm_syn_inits")
	if version < 508
		let did_dspm_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink dspmFunction		    Function
	HiLink dspmClass		    Structure
	HiLink dspmString		    String
    HiLink dspmKey              Keyword
    HiLink dspmInt              Number

	delcommand HiLink
endif

let b:current_syntax = "dspm"
