" Vundle things
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'VundleVim/Vundle.vim'
" Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'Chiel92/vim-autoformat'
"Plugin 'suan/vim-instant-markdown'
Plug 'junegunn/fzf'
" Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/goyo.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-rooter'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'RRethy/vim-hexokinase'
" Plugin 'rhysd/vim-grammarous'
" Plugin 'reedes/vim-wordy'
" Plugin 'dpelle/vim-LanguageTool'
" Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'shime/vim-livedown'
Plug 'liuchengxu/vista.vim'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'scrooloose/syntastic'
call plug#end()
filetype plugin on
filetype indent off

"colorscheme
colorscheme gruvbox
syntax enable

"tab things
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent


"scrolling things
set scrolloff=5
" paste things
set viminfo='10000,<10000,s10000


"vista things
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:30%']
let g:vista#renderer#enable_icon = 1


"colorscheme things
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1


"vim latex things
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-bibtex',
    \ ],
    \}
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_view_automatic = 0
let g:vimtex_view_enabled = 0
let maplocalleader = ','


"lightline things
" set laststatus=2
" let g:lightline = {
"       \ 'colorscheme': 'seoul256',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'currentfunction', 'readonly', 'custom_message' , 'modified'] ],
"       \   'right': [ [ 'filename' ],
"       \              [ 'lineinfo' ],
"       \              [ 'percent' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status',
"       \   'currentfunction': 'CocCurrentFunction'
"       \ },
"       \ 'component': {
"       \   'custom_message': 'why'
"       \ },
"       \ }


"fzf things
nnoremap <silent> <C-f> :FZF<CR>
let g:fzf_layout = {'left': '50%'}
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
  \ 'header':  ['fg', 'Comment'] }


"incsearch things
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#highlight = {
		\   'match' : {
		\     'group' : 'IncSearchUnderline',
		\     'priority' : '10'
		\   }
		\ }


"coc things
autocmd FileType json syntax match Comment +\/\/.\+$+
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

autocmd CursorMoved * silent call CocActionAsync('highlight')
call SetupCommandAbbrs('C', 'CocConfig')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" clangd
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cr <Plug>(coc-references)<CR>
nmap <silent> cR <Plug>(coc-rename)
nmap <silent> cI <Plug>(coc-implementation)
nmap <silent> cD <Plug>(coc-type-definition)




"custom settings
"status line
set noshowmode
"" lineno
set number relativenumber
set nu rnu
"" no hightlight
" noremap <C-H> :noh<CR>
"" spelling
noremap <silent> <C-h> : call SpellHighlight()<CR>
function! SpellHighlight()
    setlocal spell!
    hi SpellBad cterm=underline,bold guifg=#dcb9ff
    hi SpellCap cterm=underline,bold guifg=#8899ff
endfunction
"display
set display+=lastline
set shortmess+=c
"sign column color
highlight clear SignColumn
