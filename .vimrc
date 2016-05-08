set nocompatible  " not compatible to vi
set mouse=a
set nu
set autoindent
set expandtab
autocmd FileType python set cc=80
set background=dark
set statusline+=%F
set smartcase
set laststatus=2
set t_co=256
set t_ut=y
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
set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:html_indent_tags = 'p\|li\|nav'
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8', 'python']
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["python", "ruby"] }
let b:syntastic_mode = "active"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
autocmd Filetype html
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2 |
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.scss set filetype=css
syntax enable

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
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()


noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$

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
colo nevid
highlight ExtraWhitespace ctermbg=255 guibg=255
highlight SpellBad term=reverse ctermbg=118 ctermfg=016
highlight SyntasticError ctermfg=255 ctermbg=124
highlight SyntasticErrorLine ctermfg=255 ctermbg=124
highlight SyntasticWarningLine ctermfg=0 ctermbg=220
