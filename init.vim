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
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_virtualenv_dir_names = ['~/.virtualenvs']

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:html_indent_tags = 'p\|li\|nav'
let g:python3_host_prog = '/usr/local/opt/python3/bin/python3.6'
let g:strip_whitespace_on_save = 1

set statusline+=%F
set statusline+=%#warningmsg#
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
autocmd BufNewFile,BufRead *.html.tera set filetype=html
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir
autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.sh set filetype=sh
autocmd Filetype sh
      \ set ts=2 |
      \ set sw=2
autocmd Filetype elixir
      \ set ts=2 |
      \ set sw=2
" for vim-racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
set hidden
let g:racer_cmd = "/Users/valerie/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust call deoplete#enable()
syntax enable

" Plugins "
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmux-plugins/vim-tmux'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'cespare/vim-toml'
Plug 'peterhoeg/vim-qml'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'racer-rust/vim-racer'
" colorscheme install
Plug 'arcticicestudio/nord-vim'
Plug 'roosta/srcery'
Plug 'zanglg/nova.vim'


call plug#end()
"let g:python_host_prog = '/usr/bin/python2.7'
"let g:python3_host_prog = '/Users/valerie/.virtualenvs/neovim3/bin/python'

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

hi Search ctermbg=33

set termguicolors
colo nord
"set bg=dark
" highlight search when nordisk
highlight Search guifg=#002833

"material-theme bg color
"highlight Normal guibg=#263238
"solarized iterm2 bg color
"highlight Normal guibg=#002833
highlight ExtraWhitespace ctermbg=255 guibg=#ffffff
highlight SpellBad term=reverse ctermbg=118 ctermfg=016 guibg=#87ff00 guifg=#000000
highlight IndentGuidesEven guibg=darkslategray
highlight IndentGuidesOdd guibg=lightslategray
highlight ALEError guibg=#F47293 guifg=#FFFFFF
highlight ALEErrorSign guifg=#F47293
highlight ALEWarning guibg=#72F4D7 guifg=#FFFFFF
highlight ALEWarningSign guifg=#72F4D7
