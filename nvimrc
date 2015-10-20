set nocompatible

let mapleader="\<Space>"

call plug#begin('~/.nvim/plugged')
Plug 'benekastah/neomake' " async linter
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'kien/ctrlp.vim' " fuzzy finder
Plug 'rking/ag.vim' " better grep
Plug 'itchyny/lightline.vim' " powerful status line
Plug 'chriskempson/base16-vim' " color themes
Plug 'junegunn/goyo.vim' " distraction-free writing
Plug 'scrooloose/nerdtree' " tree explorer
Plug 'wakatime/vim-wakatime'   " time tracking and metrics
Plug 'xolox/vim-notes'         " notes
Plug 'xolox/vim-misc'          " vim-notes dependency

" load language specific plugins
for f in split(glob('~/.nvim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

call plug#end()

if &t_Co > 1           " if terminal supports colors
  syntax on            " turn on syntax highlighting
  set hlsearch         " highlight search matches
endif

let g:netrw_liststyle=3

" filetype detection
filetype plugin on     " ft plugin files
filetype indent on     " ft indent files

" status line
set laststatus=2       " always show status line (even on single window)
set showcmd            " display incomplete commands
set showmode           " show current mode

" brackets
set showmatch          " show matching brackets

" swap files and backups
set noswapfile
set nowritebackup

set background=dark
colorscheme base16-tomorrow
color base16-tomorrow
set cursorline
:hi CursorLine ctermfg=NONE ctermbg=237
:hi CursorLineNr ctermbg=243

set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

set guifont=Hack\ 13

" numbers
set numberwidth=4       " min num of cols to use for the line numbers
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap

set wildmenu

set splitbelow
set splitright

set ttyfast
set ruler

set autoread

" highlight current line only in active buffer
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" https://github.com/neovim/neovim/issues/2048
if has('nvim')
  nmap <BS> <C-W>h
endif

" disable arrows in normal mode
nn <up> <nop>
nn <down> <nop>
nn <left> <nop>
nn <right> <nop>

" disable arrows in insert mode
ino <up> <nop>
ino <down> <nop>
ino <left> <nop>
ino <right> <nop>

" splits
nn <silent> <C-l> <C-w>l
nn <silent> <C-k> <C-w>k
nn <silent> <C-j> <C-w>j
nn <silent> <C-h> <C-w>h

" Goyo
nnoremap <leader>g :Goyo<cr>

" make 0 go to the first character
" rather than the beginning of the line
nn 0 ^
nn ^ 0

" toggle numbers
nn <silent> <F12> :set number! relativenumber!<CR>

" git commit wrapping
autocmd Filetype gitcommit setlocal spell textwidth=72

" Use Ag instead of grep
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup

  " Use Ag for CtrlP without cache
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" NERDTree customization
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 28

let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1

nn <Leader>q :NERDTreeToggle<cr>
nn <Leader>a :NERDTreeFocus<cr>
nn <Leader>r :NERDTreeFind<cr>

" Goyo customization
let g:goyo_width = 120

function! s:goyo_enter()
  set showmode
  set showcmd
  set relativenumber
  set number
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set scrolloff=5
  set background=dark
  :hi CursorLine ctermfg=NONE ctermbg=237
  :hi CursorLineNr ctermbg=243
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" ignore some shit
set wildignore+=.git,.gitkeep                                     " git related
set wildignore+=.coverage,coverage/**,.sass-cache/                " caches & rudiments
set wildignore+=*.o,*.so,*.swp,*.zip,*.pdf,*.psd,*.obj,*~,*.pyc   " non-readable files
set wildignore+=*/.Trash/**,*.dmg,*/Library/**,*DS_Store*,*.app   " mac os x specific
set wildignore+=tmp/**,.tmp                                       " temporary
set wildignore+=*.png,*.jpg,*.gif,*.bpm,*.ico                     " images
set wildignore+=log/**,*.log                                      " logs
set wildignore+=.env,.env[0-9]+                                   " local environment files
set wildignore+=bower_modules/,node_modules/,*.min.js             " js specific
set wildignore+=*/.rbenv/**,.gem,vendor/**,rdoc/**                " ruby
set wildignore+=*.class,*.jar                                     " java
set wildignore+=*.beam                                            " erlang
set wildignore+=target/**                                         " maven
set wildignore+=_site/**                                          " jekyll
set wildignore+=.idea/**                                          " intellij idea

" strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" lint code with neomake on save
autocmd! BufWritePost * Neomake
let g:neomake_error_sign = { 'text': '>>', 'texthl': 'ErrorMsg' }
let g:neomake_warning_sign = { 'text': '>>', 'texthl': 'WarningMsg' }

" splits
" create window splits easier
nn <silent> <Leader>v <C-w>v
nn <silent> <Leader>s <C-w>s

" hate holding <Shift> every type i need to enter a cmd
nn ; :
nn : ;

" useful functions
nn =j :%!python -m json.tool<CR>        " format json
