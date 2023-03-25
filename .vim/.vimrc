unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set nocompatible                " choose no compatibility with legacy vi

set background=dark
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

set loadplugins
"let g:ledger_is_hledger=1
"let b:is_hledger=1
"let s:line_comment_chars=";"

set number

"" Whitespace
"" set nowrap                      " don't wrap lines
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
"set textwidth=0 tabstop=4 shiftwidth=4

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" set list
" set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set winwidth=90
set winminwidth=15
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

set autowriteall
set autoread

setlocal spell spelllang=en
set nospell

set winwidth=79

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

:set mouse=a

" Start NERDTree and leave the cursor in it.
let g:NERDTreeWinPos = "right"
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable list of buffers
let g:airline#extensions#tabline#enabled = 1

" list and pre-fill buffer for switching
nnoremap <Leader>b :ls<CR>:b<Space>

let g:go_imports_autosave = 1

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
