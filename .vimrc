set nocompatible  " not compatible to vi
set mouse=a
set nu
set autoindent
set tabstop=2
set expandtab
autocmd FileType python set cc=80
colo lucius
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
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd FileType rust
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2 |
      \ set cc=99 |
      \ colo lucius |
      \ set bg=dark

syntax on
try
  execute pathogen#infect()
  filet plugin indent on
catch
endtry


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins "
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tmux-plugins/vim-tmux'


call vundle#end()


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
highlight ExtraWhitespace ctermbg=255 guibg=255
highlight SpellBad term=reverse ctermbg=118 ctermfg=016
