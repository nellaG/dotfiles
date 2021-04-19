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
set updatetime=200  " for gitgutter
" solution for slow tmux navigator
"set shell=/bin/bash\ -i
set shell=sh " this resolves slow loading time of fish....why?

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"let g:ncm2_jedi#environment = '/usr'

" alrline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0


" gitgutter settings
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '✚'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '_'
let g:gitgutter_sign_removed            = '_'

" vim-go settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

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
let g:racer_cmd = "/Users/gallen/.cargo/bin/racer"
let g:racer_experimental_completer = 1


let g:html_indent_tags = 'p\|li\|nav'
" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python | head -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python"), "\n", '', 'g')
endif

let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled=1
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
autocmd BufNewFile,BufRead *.txt set filetype=txt
"enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

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
autocmd FileType python set cc=120
autocmd FileType txt set cc=105
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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType python,rust,sh,fish,vim RainbowParentheses
augroup END

"autocompletion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': './install.sh'}

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

"=== coc settings =====================
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" ====================================


" colorscheme install
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'trevordmiller/nova-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

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

"set termguicolors
colo nord
highlight CocErrorSign guifg=#F47293 ctermfg=203
highlight CocErrorHighlight guibg=#F47293 ctermbg=203
highlight CocWarningSign guifg=#72F4D7 ctermfg=50
highlight CocWarningHighlight guibg=#72F4D7 ctermbg=50
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
