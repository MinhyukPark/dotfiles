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
Plugin 'airblade/vim-rooter'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'RRethy/vim-hexokinase'
" Plugin 'rhysd/vim-grammarous'
" Plugin 'reedes/vim-wordy'
" Plugin 'dpelle/vim-LanguageTool'
" Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'shime/vim-livedown'
" Plugin 'liuchengxu/vista.vim'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin on
filetype indent off

colorscheme monokai

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
" let g:vista_default_executive = 'vim_lsp'
" let g:vista_fzf_preview = ['right:30%']


"monokai things
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1


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

"lsp things
let g:lsp_async_completion = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_popup = 0
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" imap <c-k> <Plug>(asyncomplete_force_refresh)
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"


autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file= expand('/var/log/lsp.log')
let g:asyncomplete_log_file=expand('/var/log/asy.log')
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'text': 'Ⓘ'}
let g:lsp_diagnostics_echo_cursor = 1
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
if executable('clangd-8')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd-8']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['js', 'javascript', 'javascript.jsx']
      \ })
endif
if executable('html-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'html language server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['html'],
        \ })
endif
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css language server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['css'],
        \ })
endif
if executable('json-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'json language server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'json-languageserver --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['json'],
        \ })
endif
if executable('latex_language_server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'Latex server',
      \ 'cmd': { server_info->['latex_language_server']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['latex', 'tex', 'bib']
      \ })
endif

nnoremap cR :LspRename<CR>
nnoremap cd :LspDefinition<CR>
nnoremap cD :LspDeclaration<CR>

""wordy things
" noremap <silent> <F11> :<C-u>PrevWordy<cr>
" noremap <silent> <F12> :<C-u>NextWordy<cr>
" noremap <silent> <F9> [s
" noremap <silent> <F10> ]s
" let g:wordy#ring = [
"   \ ['weak', 'being', 'passive-voice'],
"   \ ['business-jargon', 'art-jargon', 'puffery'],
"   \ 'weasel',
"   \ ['problematic', 'redundant', ],
"   \ ['colloquial', 'idiomatic', 'similies', ],
"   \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
"   \ ['adjectives', 'adverbs'],
"   \ ]

" grammarous things
" noremap <F11> :GrammarousCheck<CR>
" noremap <F12> :GrammarousReset<CR>
" noremap <F10> <Plug>(grammarous-open-info-window)
" let g:grammarous#show_first_error = 1
" language tool things
" let g:languagetool_jar='$HOME/.vim/languagetool/LanguageTool-4.4/languagetool-commandline.jar'
" noremap <F11> :LanguageToolCheck<CR>
" noremap <F12> :LanguageToolClear<CR>

"livedown things
" let g:livedown_browser = 'chromium'
" let g:livedown_port ="7123"
" let g:livedown_open = 0 
" let g:livedown_autorun = 1


" noremap <F9> :setlocal spell!<CR> 
" hi clear SpellBad
" hi SpellBad cterm=underline,bold ctermfg=red


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
    " vim
    " hi clear SpellBad
    " hi clear SpellCap
    " setlocal spell!
    " hi SpellBad cterm=underline,bold ctermfg=red
    " hi SpellCap cterm=underline,bold ctermfg=blue
    " nvim
    setlocal spell!
    hi SpellBad cterm=underline,bold guifg=#dcb9ff
    hi SpellCap cterm=underline,bold guifg=#8899ff
endfunction
"display
set display+=lastline
"sign column color
" highlight clear SignColumn
"
