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
"let g:airline_theme='luna'
let g:strip_whitespace_on_save = 1

set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
autocmd Filetype html
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2 |
autocmd Filetype js
      \ colo material-theme |
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir
autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.sh set filetype=sh
"autocmd Filetype rust
"      \ colorscheme lucius |
"      \ set bg=dark
autocmd Filetype sh
      \ set ts=2 |
      \ set sw=2
autocmd Filetype elixir
      \ set ts=2 |
      \ set sw=2 |
      \ colo gruvbox
syntax enable

" Plugins "
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmux-plugins/vim-tmux'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'Lokaltog/vim-distinguished'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bcicen/vim-vice'
Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'

call plug#end()
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/Users/valerie/.virtualenvs/neovim3/bin/python'
"call deoplete#enable()

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

hi Search ctermbg=33

"colorscheme Vivid
"colorscheme kingsroad
"colorscheme vice
"colorscheme sierra
"colo neodark
set termguicolors
"colo hilal
"colo material-theme
colo nord
"colo iceberg
"colo solarized
"set bg=dark
"highlight search when nordisk
highlight Search guifg=#002833

"material-theme bg color
"highlight Normal guibg=#263238
"solarized iterm2 bg color
"highlight Normal guibg=#002833
highlight ExtraWhitespace ctermbg=255 guibg=#ffffff
highlight SpellBad term=reverse ctermbg=118 ctermfg=016 guibg=#87ff00 guifg=#000000
highlight IndentGuidesEven guibg=darkslategray
highlight IndentGuidesOdd guibg=lightslategray
highlight SyntasticError ctermfg=255 ctermbg=124 guifg=#eeeeee guibg=#af0000
highlight SyntasticWarningLine ctermfg=0 ctermbg=220 guifg=#000000 guibg=#ffdf00
