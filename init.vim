set nocompatible  " not compatible to vi
set nu
set autoindent
set expandtab
autocmd FileType python set cc=80
set smartcase
set laststatus=2
set fileencoding=utf-8
set ruler
set hlsearch
set ignorecase
set nobackup
set novb
set fileformat=unix

" show message in English 
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

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

set statusline+=%F
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
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

" Plugins "
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmux-plugins/vim-tmux'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'Lokaltog/vim-distinguished'
Plug 'ervandew/supertab'

call plug#end()


noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

hi Search ctermbg=33

set termguicolors
colorscheme getafe
highlight ExtraWhitespace ctermbg=255 guibg=255
highlight SpellBad term=reverse ctermbg=118 ctermfg=016
highlight SyntasticError ctermfg=255 ctermbg=124
highlight SyntasticErrorLine ctermfg=255 ctermbg=124
highlight SyntasticWarningLine ctermfg=0 ctermbg=220
