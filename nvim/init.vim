set nocompatible
filetype plugin indent on
syntax on

" use case-smart searching
set ignorecase 
set smartcase

" set line numbers
set number
set relativenumber

" cmdline history
set history=1000

" allow backspace in insert mode
set backspace=indent,eol,start

" buffers can exist in the background
set hidden

" set window title
set title

set cursorline

" Add full path to status line
set statusline+=%F

" set statusline+=\ %{FugitiveStatusline()}
" set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" intelligent indentation
set autoindent
set smartindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" Auto indent pasted text
:nnoremap p ]p`]
:nnoremap P ]P`]

" map Leader to comma
let mapleader = ","


" Incremental search
set incsearch
" Hightlight all on search
set hlsearch
" remove highlights
nnoremap <leader><leader> :noh<cr>

" plugins start
call plug#begin('~/.config/nvim/plugged')

" file explorer
Plug 'scrooloose/nerdtree'
" colorscheme
Plug 'iCyMind/NeoSolarized'
" colorscheme
" Plug 'NLKNguyen/papercolor-theme'
" colorscheme
" Plug 'morhetz/gruvbox'
" commenting
Plug 'scrooloose/nerdcommenter'
" tmux integration
Plug 'christoomey/vim-tmux-navigator'
" insert brackets/quotes etc. in pairs
Plug 'jiangmiao/auto-pairs'
" Sublime's multiple selection
Plug 'terryma/vim-multiple-cursors'
" surroundings
Plug 'tpope/vim-surround'
" Latex
Plug 'lervag/vimtex'
" Completion 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" Display changes in git:
Plug 'airblade/vim-gitgutter'
" Git wrapper
" Plug 'tpope/vim-fugitive'
" Status line
Plug 'itchyny/lightline.vim'

" plugins end
call plug#end()

" Auto install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" enable syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif


set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1
let g:tex_flavor = 'latex'
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'tex': g:vimtex#re#deoplete
  \})
" Tab based completion
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"

" solarized theme
set termguicolors
colorscheme NeoSolarized 
set background=dark


" use System Clipboard:
set clipboard^=unnamed,unnamedplus

" Delete single character without updating default register
nnoremap x "_x

" Delete without copying deleted text
nnoremap d "_d
vnoremap d "_d

" Paste in visual mode without updating default register (don't copy the text
" you pasted over)
vnoremap p "_dP

" Change without copying deleted text
nnoremap c "_c
vnoremap c "_c

" Delete in whatever without copying deleted text
nnoremap ci "_ci
nnoremap di "_di

" Stay in visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" enable mouse support
" set mouse=a

" f to toggle tree view
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Switch Vim panes with <Leader>w	
nnoremap <Leader>w <C-w>w

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q

" Open splits on the right and below
set splitbelow
set splitright

" Automatically resize splits when resizing window
autocmd VimResized * wincmd = 

" Keep 5 lines below and above the cursor
set scrolloff=5 

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


" Navigate in insert mode to start/end of line
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" " Next sentence / Previous Sentence
" :nnoremap m )
" :nnoremap M (
" 
" " Delete to end of sentence / beginning of sentence
" :nnoremap dm d)
" :nnoremap dM d(

" Set low update time for gitgutter
set updatetime=250

" NerdCommenter customizations
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
let NERDSpaceDelims = 1

" Cycle through buffers with tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Close buffer and close window
:nnoremap <leader>d :bd<CR>

" Close buffer without closing window
:nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Close buffer without closing split using Bd
command Bd bp|bd #

let g:vimtex_view_method = 'skim'
let g:vimtex_complete_enabled = 1

" Use ripgrep for cltrp
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0

" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell


" Faster tex files (reduce syntax highlighting)
let g:tex_fast="mMpr"

" Set up vim-surround for LaTeX commands
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'})

" Configure lightline for statusline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
      

" Fix for deoplete/Multiple_cursors conflict (https://github.com/terryma/vim-multiple-cursors/issues/235#issuecomment-466128522)
func! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc
func! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc

