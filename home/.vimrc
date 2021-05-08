" You're gonna want to debug this eventually :]
"set rtp+=~/path/to/minivimrc
"source ~/path/to/minivimrc/vimrc

set shell=/bin/sh
set t_Co=256

set nocompatible
call plug#begin('~/.vim/plugged')

let mapleader = "\\"
" let mapleader = ","

syntax on
set number
set hlsearch

set mouse=a

set splitbelow
set splitright

set scrolloff=10

set updatetime=300
set shortmess+=c
set signcolumn=yes

set nobackup
set nowritebackup

" The Fancy Shit
Plug 'vim-scripts/SyntaxComplete'

" Polyglot to so at least everything is highlighted
Plug 'sheerun/vim-polyglot'

" Javascript
" apparently these are passe
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'ianks/vim-tsx'

" This one is very expensive
Plug 'ternjs/tern'

" Apparently this is the recommended shit, according to https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'yuezk/vim-js'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,react,underscore,jasmine,chai,handlebars,vue,d3,tape'

Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'elzr/vim-json'
Plug 'jxnblk/vim-mdx-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Python
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Documentation
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'

" Aspirational and Things that I Might actually use or learn
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'

" tmux assistance
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-obsession'

" Useful plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Visual Setup

set fillchars+=vert:\|
" Highlight lines past length recommendation
let &colorcolumn="80,".join(range(120,999),",")

" i like special characters
" but it's too much with carraige returns
set list listchars=tab:»\ ,nbsp:¬
"set list listchars=tab:»\ ,eol:¶,nbsp:¬

" rainbow brackets
Plug 'amdt/vim-niji'

" fancy icons
Plug 'ryanoasis/vim-webdevicons'

" themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'dikiaap/minimalist'
Plug 'jonathanfilip/vim-lucius'
Plug 'Lokaltog/vim-distinguished'
"Plug 'chriskempson/base16-vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_statusline_ontop=0

" Spell Checking
Plug 'kamykn/spelunker.vim'
set nospell
let g:enable_spelunker_vim = 0
let g:spelunker_check_type = 2 " only check words visible in the buffer

"------------------------ FZF ------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ignore files and folders in git ignore
command! FZFGitIgnore call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))
nmap <C-p> :FZFGitIgnore <CR>
imap <C-p> <Esc>:FZFGitIgnore <CR>
nmap <Leader>fzl <Esc>:Lines<CR>
nmap <Leader>fzb <Esc>:Buffers<CR>
nmap <Leader>fzc <Esc>:Commits<CR>


"------------------------ ag/ack ------------------------
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <C-S-A> :Ack<space>
imap <C-S-A> <Esc>:Ack<space>

"------------------------ Command T ------------------------
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }

"------------------------ NERD TREE ------------------------
Plug 'scrooloose/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>
nnoremap <Leader>ntf :NERDTreeFocus<CR>
nnoremap <Leader>1 :NERDTreeFocus<CR>
nnoremap <Leader>ntr :NERDTreeRefreshRoot<CR>
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"------------------------ AUTO SAVE ------------------------
Plug '907th/vim-auto-save'
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]


"------------------------ NERD COMMENTER ------------------------
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'typescript': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

call plug#end()

set background=dark

colorscheme delek
let g:airline_theme='badwolf'

"function GoDark()
"  set background=dark
"  let g:background='dark'
"  let g:airline_theme='distinguished'
"  colorscheme PaperColor
"  "colorscheme lucius
"  "LuciusBlack
"  "LuciusDark
"  "LuciusDarkHighContrast
"  "colorscheme minimalist
"  "colorscheme distinguished
"endfunction
"
"function GoLight()
"  set background=light
"  let g:background='light'
"  let g:airline_theme='papercolor'
"  "colorscheme PaperColor
"  colorscheme lucius
"  LuciusLightHighContrast
"  "colorscheme minimalist
"  "colorscheme distinguished
"endfunction
"
"" set the background by the time of day
"if strftime("%H") < 19 && strftime("%H") > 7
"  :call GoLight()
"else
"  :call GoDark()
"endif

"" toggle dark and light modes
"function! Lightswitch()
"  if (&background == 'dark')
"    :call GoLight()
"  else
"    :call GoDark()
"  endif
"endfunction

"" Base 16 Shell integration
"if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"endif
