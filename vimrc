set nocompatible        "not well understood
syntax enable           "turn on syntax highlighting
set showcmd             "show commands as they are typed
set number              "turn on line numbering
set hlsearch            "highlight search results
set incsearch           "incremental search
set mouse=a             "enable mouse support
set title
set icon
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

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
