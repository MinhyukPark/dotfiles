set nocompatible
filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'VundleVim/Vundle.vim'
Plug 'morhetz/gruvbox'
Plug 'Chiel92/vim-autoformat'
Plug 'shime/vim-livedown'
"Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vista.vim'
call plug#end()
filetype plugin on
filetype indent off

""" ----------
""" A E S T H E T I C

"" colorscheme
colorscheme gruvbox
syntax enable
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1

"" vista things
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:30%']
let g:vista#renderer#enable_icon = 1

"" status line
set noshowmode
set number relativenumber
set nu rnu

" airline things
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

"" display
set display+=lastline
set shortmess+=c

"" sign column color
highlight clear SignColumn

"" livevedown things
let g:livedown_browser = "firefox"
let g:livedown_port ="7123"
let g:livedown_open = 1
let g:livedown_autorun = 1

""" ----------
""" LINT

"" tab things
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

"" trailing whitespace highlight
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" spelling
noremap <silent> <C-h> : call SpellHighlight()<CR>
function! SpellHighlight()
    setlocal spell!
    hi SpellBad cterm=underline,bold guifg=#dcb9ff
    hi SpellCap cterm=underline,bold guifg=#8899ff
endfunction

"" coc things
let g:coc_global_extensions = [
\   'coc-pyright',
\   'coc-sh@0.6.1'
\]
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" vim latex things
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-bibtex',
    \    '-f',
    \ ],
    \ }
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_view_automatic = 0
let g:vimtex_view_enabled = 0
let maplocalleader = ','

""" ----------
""" NAVIGATION

"" scrolling things
set scrolloff=5

"" paste things
set viminfo='10000,<10000,s10000

"" netrw things
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_browse_split = 4
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
"     autocmd VimEnter *  2wincmd w
" augroup END
autocmd FileType netrw setl bufhidden=wipe


"" fzf things
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
let g:fzf_layout = {'left': '50%'}
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \ }

"" incsearch things
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#highlight = {
    \ 'match' : {
    \     'group' : 'IncSearchUnderline',
    \     'priority' : '10'
    \     }
    \ }
