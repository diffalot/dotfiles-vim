set nocompatible              " be iMproved
filetype off                  " required!

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

call plug#begin()

" My bundles here:
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'godlygeek/Tabular'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'yegappan/grep'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?" ".fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

Plug 'w0rp/ale'
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'vue': ['eslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

Plug 'Raimondi/delimitMate'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'marijnh/tern_for_vim'

" vue
Plug 'posva/vim-vue'

" Prettier
"Plug 'sbdchd/neoformat'
"autocmd BufWritePre *.js Neoformat

" CSS
Plug 'csscomb/vim-csscomb'
" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>
" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb<CR>

" Ruby
Plug 'avakhov/vim-yaml'

" Testing?
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'


" use temp directories in ~.vim/tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" Use the mouse and set it up for tmux/screen
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" i like special characters
set list listchars=tab:»\ ,eol:¶,nbsp:¬
set number

" setup some keybindings
let mapleader = "\\"
nmap <leader>n :NERDTreeToggle<cr>

" spell checking
autocmd FileType tex,markdown,gitcommit setlocal spell spelllang=en_us
nmap <leader>s :setlocal spell spelllang=en_us<cr>

" insure saves will trigger webpack rebuild
set backupcopy=yes

" Highlight lines past length recommendation
"let &colorcolumn="80,".join(range(120,999),",")

" Colorschemes
Plug 'vim-scripts/xoria256.vim'
Plug 'jonathanfilip/vim-lucius'

call plug#end()

set t_Co=256
colorscheme lucius
LuciusDarkHighContrast
"colorscheme xoria256
