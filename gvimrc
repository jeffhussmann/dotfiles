set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=m
colorscheme desert

let &colorcolumn=join(range(81, 999),",")
hi ColorColumn guibg=#2d2d2d
highlight clear SignColumn

nnoremap <S-Up> :wincmd k<CR> 
nnoremap <S-Down> :wincmd j<CR> 
nnoremap <S-Left> :wincmd h<CR> 
nnoremap <S-Right> :wincmd l<CR> 
map <silent> <F11> :call system("wmctrl -ir " v:windowid . " -b toggle,fullscreen")<CR>
