set nocompatible  " not compatible to vi

set autoindent
set dir=~/nvimtmp
set expandtab
set fileencoding=utf-8
set fileformat=unix
set hidden
set hlsearch
set ignorecase
set langmenu=en_US.UTF-8 " show status message in English
language messages en_US.UTF-8
set laststatus=2
set nobackup
set novb
set nu
set ruler
set smartcase
set ts=4 sw=4 et
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%*
set swapfile

" ale settings
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '☢'
let g:ale_completion_delay = 50
let g:ale_lint_delay = 100
let g:ale_lint_on_insert_leave = 1
let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]
let g:ale_python_pylint_options = '--rcfile $HOME/.pylintrc'

" indent_guides settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2

" racer settings
let g:racer_cmd = "/Users/valerie/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:html_indent_tags = 'p\|li\|nav'
let g:python3_host_prog = '/usr/local/opt/python3/bin/python3.6'
let g:strip_whitespace_on_save = 1
let g:airline_theme = 'term'

" autocmd settings
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.html.tera set filetype=html
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir
autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.sh set filetype=sh
autocmd BufNewFile,BufRead *.yml set filetype=yaml
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=4
autocmd Filetype elixir
      \ set ts=2 |
      \ set sw=2
autocmd Filetype html
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2 |
autocmd Filetype js
      \ colo material-theme |
autocmd FileType python set cc=80

" vim-racer settings
autocmd Filetype rust
      \ nmap gd <Plug>(rust-def) |
      \ nmap gs <Plug>(rust-def-split) |
      \ nmap gx <Plug>(rust-def-vertical) |
      \ nmap <leader>gd <Plug>(rust-doc) |
      \ call deoplete#enable()

autocmd Filetype sh
      \ set ts=2 |
      \ set sw=2
autocmd Filetype yaml
      \ set ts=2 |
      \ set sw=2

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
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'racer-rust/vim-racer'
" colorscheme install
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'whatyouhide/vim-gotham'
Plug 'michaelmalick/vim-colors-bluedrake'

call plug#end()

" vim key settings
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" color settings
colo peachpuff

if $ITERM_PROFILE == "Nord"
    colo nord
endif

highlight ALEError guibg=#F47293 guifg=#FFFFFF
highlight ALEErrorSign guifg=#F47293
highlight ALEWarning guibg=#72F4D7 guifg=#FFFFFF
highlight ALEWarningSign guifg=#72F4D7
highlight ExtraWhitespace ctermbg=255 guibg=#ffffff
highlight IndentGuidesEven ctermbg=2
highlight IndentGuidesOdd ctermbg=4
highlight LineNr guibg=NONE
highlight Normal guibg=NONE
highlight SpellBad term=reverse ctermbg=118 ctermfg=016 guibg=#87ff00 guifg=#000000
