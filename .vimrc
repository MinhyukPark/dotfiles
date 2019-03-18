syntax enable
"tab things
set tabstop=4
set shiftwidth=4
set expandtab
" scrolling things
set scrolloff=5
"monokai things
set termguicolors
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
colorscheme monokai

"vim latex things
let g:vimtex_view_general_viewer = 'chromium'
let maplocalleader = ','

"lightline things
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'custom_message' , 'modified'] ],
      \   'right': [ [ 'filename' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'custom_message': 'why'
      \ },
      \ }

" fzf stuff
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
"Syntastic things
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" incsearch things
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map <Tab> <Over>(incsearch-next)
map <S-Tab> <Over>(incsearch-prev)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#highlight = {
		\   'match' : {
		\     'group' : 'IncSearchUnderline',
		\     'priority' : '10'
		\   }
		\ }

"custom settings
set number relativenumber
set nu rnu
" Vundle things
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'suan/vim-instant-markdown'
Plugin 'junegunn/fzf'
Plugin 'itchyny/lightline.vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-commentary'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin on
filetype indent off

" paste things
set viminfo='10000,<10000,s10000
