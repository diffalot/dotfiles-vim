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

" Web
" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" MDX
Plug 'jxnblk/vim-mdx-js'

" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Aspirational
" Polyglot
Plug 'sheerun/vim-polyglot'

" Rust
Plug 'rust-lang/rust.vim'

" LaTeX
Plug 'lervag/vimtex'

" Useful plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tmux assistance
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" Visual

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
Plug 'Lokaltog/vim-distinguished'
Plug 'dikiaap/minimalist'
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'

" Spell Checking
Plug 'kamykn/spelunker.vim'
set nospell
let g:enable_spelunker_vim = 1
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


"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Use deoplete if you don't want do use CoC
"if has('nvim')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

call plug#end()

"" Base 16 Shell integration
"if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"endif

" colorscheme lucius
" LuciusDarkHighContrast
" set background=dark
" colorscheme distinguished
colorscheme minimalist

" coc configuration
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile
"
"" inoremap <silent><expr> <TAB>
""       \ pumvisible() ? "\<C-n>" :
""       \ <SID>check_back_space() ? "\<TAB>" :
""       \ coc#refresh()
"" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"inoremap <silent><expr> <C-j>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>ac  <Plug>(coc-codeaction)
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"command! -nargs=0 Format :call CocAction('format')
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
