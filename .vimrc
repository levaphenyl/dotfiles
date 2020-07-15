" Inspired from the Arch Linux global vimrc
"
" Use /etc/vimrc for system-wide and $HOME/.vimrc for personal configuration
" (for details see ':help initialization').
"
" Use :help '<option>' to see the documentation for the given option.

" Use Vim defaults instead of 100% vi compatibility
" Avoid side-effects when nocompatible has already been set.
if &compatible
  set nocompatible
endif

set backspace=indent,eol,start
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj

" Move temporary files to a secure location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif
let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'
" Create directories if they doesn't exist
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif

" Create parent directories on save
" From: https://stackoverflow.com/a/4294176/8289769
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Automatically reload vimrc when saving it
" From: https://stackoverflow.com/a/2400289/8289769
augroup rcreload
    autocmd!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Add libraries to path for autocompletion
set path+=/usr/include/**
set path+=/usr/lib/python*/**

" Enable echodoc.
" Preview for signature: [i
set cmdheight=2
let g:echodoc#enable_at_startup=1

" Enable latexsuite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Enable jupytext.vim
let g:jupytext_enable = 1
let g:jupytext_fmt = 'md'

" Enable syntastic
syntax on
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_chktex_args = "-n 1 -n 8 -n 13 -n 44"

" Configuration of jedi-vim
if has('python3')
    let g:jedi#force_py_version = 3
endif
let g:jedi#show_call_signatures = 2

" Personal preferences
set ruler
set number
set relativenumber
colorscheme phenyl
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set fileencoding=utf-8
" From: https://stackoverflow.com/a/2280090/8289769
set textwidth=80
set formatoptions=croqlnj
" Clear last search pattern
" From: https://stackoverflow.com/a/657484/8289769
nnoremap <CR> :let @/ = ""<CR><CR>

" From: http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" Define custom highlight groups
highlight User1 ctermbg=DarkBlue ctermfg=fg
highlight User2 ctermbg=Red ctermfg=fg
highlight User3 ctermbg=DarkGray ctermfg=fg
" Define status line
set statusline=%1*      "switch to User1 highlight
set statusline+=%t      "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%2*     "switch to User2 highlight
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%3*     "switch to User3 highlight
set statusline+=%y      "filetype
set statusline+=%=      "right align
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P\    "percent through file
set statusline+=%#warningmsg# "switch to warning highlight
set statusline+=%{SyntasticStatuslineFlag()} "syntastic message
set statusline+=%*

" Set tabs display
set list lcs=trail:·,tab:»·

