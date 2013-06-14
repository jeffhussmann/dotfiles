set nocompatible        "not well understood
syntax enable           "turn on syntax highlighting
set showcmd             "show commands as they are typed
set number              "turn on line numbering
set hlsearch            "highlight search results
set incsearch           "perform incremental search as they are typed
set mouse=a             "enable mouse support
set splitbelow          "open new splits on the bottom
set splitright          "open new splits on the right
set title
set icon 
" Split window vertically
nnoremap <Bar> <C-W>v<C-W><Right>
" Split window horizontally 
nnoremap _ <C-W>s<C-W><Down>
autocmd BufEnter * let &titlestring=expand('%:t')
autocmd BufEnter * let &iconstring=expand('%t:t')
filetype plugin indent on
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set laststatus=2
imap jj <Esc>
set scrolloff=5
set wildmode=longest,list,full
set nowrap
highlight clear SignColumn
