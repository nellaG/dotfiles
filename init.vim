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

" alrline settings
let g:airline#extensions#tabline#enabled = 0  " for bufferline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0

" vim-go settings
let $HIGHLIGHT_SETTINGS = join(['array_whitespace_error', 'build_constraints',
        \ 'chan_whitespace_error', 'extra_types', 'fields', 'format_strings',
        \ 'function_arguments', 'function_calls', 'functions', 'generate_tags',
        \ 'operators', 'space_tab_error', 'string_spellcheck',
        \ 'trailing_whitespace_error', 'types', 'variable_assignments',
        \ 'variable_declarations'], ' ')
for s:s in split($HIGHLIGHT_SETTINGS, ' ')
  call execute('let g:go_highlight_' . s:s . ' = 1')
endfor

" gitgutter settings
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '✚'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '_'
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
let g:airline_theme = 'base16_material'

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

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

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
autocmd FileType python set cc=80,120
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

"-------
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'folke/which-key.nvim'
Plug 'https://github.com/qpkorr/vim-bufkill'

"-------
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType python,rust,sh,fish,vim RainbowParentheses
augroup END

" telescope key (leader: \ key)
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

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

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'shaunsingh/solarized.nvim'
Plug 'michaelmalick/vim-colors-bluedrake'
Plug 'talha-akram/noctis.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

let g:material_theme_style = 'palenight'  " palenight | ocean
"let g:airline_theme = 'rigel'

call plug#end()

"vim key settings
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> O gO
noremap <buffer> <silent> $ g$
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-i> a <ESC>r
nnoremap <F8> :NvimTreeToggle<CR>
" command line mode mapping
cnoremap bd BD

set termguicolors
lua << EOF
require("bufferline").setup{}
require("nvim-tree").setup()
EOF
colo material

highlight CocErrorSign guifg=#F47293 ctermfg=203
highlight CocErrorHighlight guibg=#F47293 ctermbg=203
highlight CocWarningSign guifg=#72F4D7 ctermfg=50
highlight CocWarningHighlight guibg=#72F4D7 ctermbg=50
highlight ExtraWhitespace ctermbg=255 guibg=#ffffff
highlight IndentGuidesEven guibg=#5c7080 ctermbg=2
highlight IndentGuidesOdd guibg=#4c6070 ctermbg=4
"highlight LineNr guibg=NONE ctermbg=NONE
"highlight Normal guibg=NONE ctermbg=NONE
highlight SpellBad term=reverse ctermbg=118 ctermfg=016 guibg=#87ff00 guifg=#000000
highlight clear SignColumn
highlight SignColumn guibg=NONE ctermbg=NONE
highlight Visual ctermbg=3
highlight ColorColumn ctermbg=2
let g:indent_guides_start_level = 2
