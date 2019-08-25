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
set nu
language messages en_US.UTF-8
set laststatus=2
set nobackup
set novb
set ruler
set smartcase
set ts=2 sw=2 et
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%*
set swapfile
set cc=80,120
" solution for slow tmux navigator
"set shell=/bin/bash\ -i
set shell=sh " this resolves slow loading time of fish....why?

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

let g:ncm2_jedi#environment = '/usr'

" alrline settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0

" ale settings
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_history_enabled = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '☢'
let g:ale_completion_delay = 50
let g:ale_lint_delay = 100
let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]
let g:ale_python_pylint_options = '--rcfile $HOME/.pylintrc'

" gitgutter settings
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '✚'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '_'

" indent_guides settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2

" markdown extension configuration
let g:vim_markdown_folding_disabled = 1

" nord colorscheme configuration
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1


" racer settings
let g:racer_cmd = "/Users/valerie/.cargo/bin/racer"
let g:racer_experimental_completer = 1


let g:html_indent_tags = 'p\|li\|nav'
let g:python3_host_prog = '/usr/local/bin/python3'
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
"enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=4
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
autocmd FileType markdown set cc=120

" vim-racer settings
autocmd Filetype rust
      \ nmap gd <Plug>(rust-def) |
      \ nmap gs <Plug>(rust-def-split) |
      \ nmap gx <Plug>(rust-def-vertical) |
      \ nmap <leader>gd <Plug>(rust-doc) |
      \ set cc=80,120

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
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'racer-rust/vim-racer'
Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux'
Plug 'cespare/vim-toml'
Plug 'peterhoeg/vim-qml'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'derekwyatt/vim-scala'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'HerringtonDarkholme/yats.vim'
" install ncm2 completion sources
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'

" colorscheme install
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'trevordmiller/nova-vim'
let g:airline_theme = 'nord'

call plug#end()

"vim key settings
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

set termguicolors
colo nord
highlight ALEError guibg=#F47293 guifg=#FFFFFF
highlight ALEErrorSign guifg=#F47293 ctermfg=203
highlight ALEWarning guibg=#72F4D7 guifg=#FFFFFF
highlight ALEWarningSign guifg=#72F4D7
highlight ExtraWhitespace ctermbg=255 guibg=#ffffff
highlight IndentGuidesEven guibg=#5c7080 ctermbg=2
highlight IndentGuidesOdd guibg=#4c6070 ctermbg=4
highlight LineNr guibg=NONE ctermbg=NONE
"highlight Normal guibg=NONE ctermbg=NONE
highlight SpellBad term=reverse ctermbg=118 ctermfg=016 guibg=#87ff00 guifg=#000000
highlight clear SignColumn
highlight SignColumn guibg=NONE ctermbg=NONE
highlight Visual ctermbg=3
highlight ColorColumn ctermbg=2
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
