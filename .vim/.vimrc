call pathogen#infect()

set background=dark
"colorscheme solarized
sy on

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

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

filetype plugin on
filetype indent on

setlocal spell spelllang=en

set winwidth=79

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
