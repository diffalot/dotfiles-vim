syntax on
set number
set mouse=a
set splitbelow
set splitright
set scrolloff=10

call plug#begin('~/.vim/plugged')

" Polyglot to so at least everything is highlighted
Plug 'sheerun/vim-polyglot'

" tmux assistance
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" Useful plugins
Plug 'editorconfig/editorconfig-vim'

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
let g:airline_statusline_ontop=0
let g:airline_powerline_fonts = 1

"------------------------ NERD TREE ------------------------
Plug 'scrooloose/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>
nnoremap <Leader>ntf :NERDTreeFocus<CR>
nnoremap <Leader>1 :NERDTreeFocus<CR>
nnoremap <Leader>ntr :NERDTreeRefreshRoot<CR>
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#end()

function GoDark()
  set background=dark
  let g:background='dark'
  let g:airline_theme='distinguished'
  colorscheme PaperColor
  "colorscheme lucius
  "LuciusBlack
  "LuciusDark
  "LuciusDarkHighContrast
  "colorscheme minimalist
  "colorscheme distinguished
endfunction

function GoLight()
  set background=light
  let g:background='light'
  let g:airline_theme='papercolor'
  "colorscheme PaperColor
  colorscheme lucius
  LuciusLightHighContrast
  "colorscheme minimalist
  "colorscheme distinguished
endfunction

" set the background by the time of day
if strftime("%H") < 19 && strftime("%H") > 7
  :call GoLight()
else
  :call GoDark()
endif

" toggle dark and light modes
function! Lightswitch()
  if (&background == 'dark')
    :call GoLight()
  else
    :call GoDark()
  endif
endfunction

"" Base 16 Shell integration
"if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"endif
