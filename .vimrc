set nocompatible  " not compatible to vi
set mouse=a
set nu
set autoindent
set tabstop=2
set expandtab
autocmd FileType python set cc=80
colo peachpuff
set background=dark
set statusline+=%F
set laststatus=2
set t_co=256
set term=screen-256color
set fileencoding=utf-8
set ruler
set hlsearch
set ignorecase
set nobackup
set novb
set ml
set mls=3
set fileformat=unix
set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:html_indent_tags = 'p\|li\|nav'

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
autocmd BufNewFile,BufRead *.html.erb set filetype=html

syntax on
try
  execute pathogen#infect()
  filet plugin indent on
catch
endtry

filetype plugin indent on

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

highlight ExtraWhitespace ctermbg=255 guibg=255
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END

function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction

au BufNewFile, BufRead *.less set filetype=css

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$

call pathogen#infect()

hi Search ctermbg=33

function! InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col-1]!~'\k'
  return "\<TAB>"
else
  if pumvisible()
    return "\<C-N>"
  else
    return "\<C-N>\<C-P>"
  end
endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
colo peachpuff
highlight ExtraWhitespace ctermbg=255 guibg=255
highlight SpellBad term=reverse ctermbg=118 ctermfg=016
