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

" Runtime path must include /usr/share/vim/vimfiles
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after'

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
" Automatically reload the current file
set autoread

" Add libraries to path for autocompletion
set path+=/usr/include/**
set path+=/usr/lib/python*/**

" Declare plugins for vim-plug.
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/LanguageTool'
Plug 'vim-scripts/latex-box'
Plug 'Shougo/echodoc.vim'
Plug 'goerz/jupytext.vim'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
call plug#end()

" Enable echodoc.
" Preview for signature: [i
set cmdheight=2
let g:echodoc#enable_at_startup=1

" Enable latex-box
filetype plugin on

" Enable jupytext.vim
let g:jupytext_enable = 1
let g:jupytext_fmt = 'py'

" Enable ALE completion, disable ongoing linting.
syntax on
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_delay = 500
" Function to count errors and warnings.
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(' %dW %dE', all_non_errors, all_errors)
endfunction

" Configuration of jedi-vim
if has('python3')
    let g:jedi#force_py_version = 3
endif
let g:jedi#show_call_signatures = 2

" Configuration of LanguageTool
let g:languagetool_cmd='/usr/bin/languagetool'

" Personal preferences
set ruler
set number
set relativenumber
colorscheme phenyl
set hlsearch
set tabpagemax=15
set laststatus=2
" Indentation, from https://docs.python-guide.org/dev/env/
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
" Encoding
set encoding=utf-8
set fileencoding=utf-8
" From: https://stackoverflow.com/a/2280090/8289769
set textwidth=84
set formatoptions+=ronj
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
set statusline+=%{LinterStatus()} " call ALE counters
set statusline+=%3*     "switch to User3 highlight
set statusline+=%y      "filetype
set statusline+=[%{&fo}]  "format options
set statusline+=%=      "right align
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P\    "percent through file
set statusline+=%*

" Set tabs display
set list lcs=trail:·,tab:»·

