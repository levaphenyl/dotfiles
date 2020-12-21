" Phenyl's Vim color scheme.
" Email: phenyl@posteo.net
"
" Used with urxvt together with the custom .Xresources.
" Based on 'sorcerer.vim' by Jeet Sukumaran.

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="phenyl"

" Terminal colors only
" ====================
"
" See: :help cterm-colors
"      :help highlight-groups
hi Normal         cterm=NONE          ctermbg=Black       ctermfg=White
hi ColorColumn    cterm=NONE          ctermbg=bg          ctermfg=fg
hi Cursor         cterm=NONE          ctermbg=fg          ctermfg=bg
hi CursorColumn   cterm=NONE          ctermbg=bg          ctermfg=fg
hi CursorLine     cterm=NONE          ctermbg=bg          ctermfg=fg
hi DiffAdd        cterm=NONE          ctermbg=DarkGreen   ctermfg=White
hi DiffDelete     cterm=NONE          ctermbg=DarkRed     ctermfg=White
hi DiffChange     cterm=NONE          ctermbg=bg          ctermfg=DarkBlue
hi DiffText       cterm=NONE          ctermbg=DarkBlue    ctermfg=White
hi Directory      cterm=NONE          ctermbg=bg          ctermfg=Blue
hi ErrorMsg       cterm=bold          ctermbg=bg          ctermfg=Red
hi FoldColumn     cterm=bold          ctermbg=DarkGray    ctermfg=Cyan
hi Folded         cterm=NONE          ctermbg=bg          ctermfg=Gray
hi IncSearch      cterm=bold          ctermbg=DarkYellow  ctermfg=White
hi LineNr         cterm=NONE          ctermbg=Black       ctermfg=Gray
hi LineNrAbove    cterm=NONE          ctermbg=Black       ctermfg=DarkGray
hi LineNrBelow    cterm=NONE          ctermbg=Black       ctermfg=DarkGray
hi MatchParen     cterm=bold          ctermbg=bg          ctermfg=Yellow
hi ModeMsg        cterm=bold          ctermbg=DarkGreen   ctermfg=White
hi MoreMsg        cterm=bold          ctermbg=bg          ctermfg=Green
hi NoneText       cterm=None          ctermbg=bg          ctermfg=Gray
hi Pmenu          cterm=NONE          ctermbg=DarkGray    ctermfg=fg
hi PmenuSbar      cterm=NONE          ctermbg=Gray        ctermfg=Black
hi PmenuSel       cterm=NONE          ctermbg=Green       ctermfg=Black
hi Question       cterm=bold          ctermbg=bg          ctermfg=Green
hi Search         cterm=NONE          ctermbg=Yellow      ctermfg=Black
hi SignColumn     cterm=NONE          ctermbg=Brown       ctermfg=White
hi SpecialKey     cterm=NONE          ctermbg=bg          ctermfg=DarkGray
hi SpellBad       cterm=undercurl     ctermbg=bg          ctermfg=Red
hi SpellCap       cterm=undercurl     ctermbg=bg          ctermfg=Blue
hi SpellLocal     cterm=undercurl     ctermbg=bg          ctermfg=DarkCyan
hi SpellRare      cterm=undercurl     ctermbg=bg          ctermfg=Magenta
hi StatusLine     cterm=bold          ctermbg=DarkBlue    ctermfg=bg
hi StatusLineNC   cterm=NONE          ctermbg=bg          ctermfg=Black
hi VertSplit      cterm=NONE          ctermbg=bg          ctermfg=bg
hi TabLine        cterm=bold          ctermbg=bg          ctermfg=DarkGray
hi TabLineFill    cterm=NONE          ctermbg=bg          ctermfg=bg
hi TabLineSel     cterm=bold          ctermbg=DarkGray    ctermfg=fg
hi Title          cterm=bold          ctermbg=bg          ctermfg=DarkCyan
hi Visual         cterm=bold          ctermbg=DarkBlue    ctermfg=NONE
hi WarningMsg     cterm=NONE          ctermbg=bg          ctermfg=Brown
hi WildMenu       cterm=NONE          ctermbg=Blue        ctermfg=Black

" General syntax
hi Comment        cterm=NONE          ctermbg=bg          ctermfg=DarkGray
hi Boolean        cterm=NONE          ctermbg=bg          ctermfg=DarkYellow
hi String         cterm=NONE          ctermbg=bg          ctermfg=Green
hi Identifier     cterm=NONE          ctermbg=bg          ctermfg=fg
hi Function       cterm=NONE          ctermbg=bg          ctermfg=fg
hi Type           cterm=NONE          ctermbg=bg          ctermfg=Magenta
hi Statement      cterm=NONE          ctermbg=bg          ctermfg=Blue
hi Keyword        cterm=NONE          ctermbg=bg          ctermfg=Blue
hi Constant       cterm=NONE          ctermbg=bg          ctermfg=DarkYellow
hi Number         cterm=NONE          ctermbg=bg          ctermfg=DarkYellow
hi Special        cterm=NONE          ctermbg=bg          ctermfg=DarkGreen
hi PreProc        cterm=NONE          ctermbg=bg          ctermfg=Cyan
hi Todo           cterm=underline     ctermbg=bg          ctermfg=DarkMagenta

" Diff
hi diffOldFile    cterm=NONE          ctermbg=bg          ctermfg=Blue
hi diffNewFile    cterm=NONE          ctermbg=bg          ctermfg=Blue
hi diffFile       cterm=NONE          ctermbg=bg          ctermfg=Blue
hi diffLine       cterm=NONE          ctermbg=bg          ctermfg=Blue
hi diffAdded      cterm=NONE          ctermfg=bg          ctermfg=DarkGreen
hi diffRemoved    cterm=NONE          ctermfg=bg          ctermfg=DarkRed
hi diffChanged    cterm=NONE          ctermfg=bg          ctermfg=DarkBlue
hi link           diffSubname         diffLine
hi link           diffOnly            Constant
hi link           diffIdentical       Constant
hi link           diffDiffer          Constant
hi link           diffBDiffer         Constant
hi link           diffIsA             Constant
hi link           diffNoEOL           Constant
hi link           diffCommon          Constant
hi link           diffComment         Constant

