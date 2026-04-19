" .vimrc

set number
set mouse=a
syntax on

" Normal mode mappings for navigation
nnoremap fs gg
nnoremap fe G
nnoremap end $
nnoremap srt 0
nnoremap srtw ^

" Operator-pending mappings 
onoremap fs gg
onoremap fe G
onoremap end $
onoremap srt 0
onoremap srtw ^

" System clipboard copy
nnoremap cp "+y
vnoremap cp "+y

nnoremap cpa gg"+yG

nnoremap cmt I#<Esc>
nnoremap cmr :s/^\(\s*\)#/\1/e<CR>

vnoremap cmt :s/^/#/<CR>
vnoremap cmr :s/^#//<CR>
