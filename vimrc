" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

call pathogen#infect()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax enable
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

set undolevels=500

" ================ Indentation ======================

set autoindent
set smartindent
set copyindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=2       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
nnoremap <space> za
vnoremap <space> zf

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================= No Beeps ========================

set visualbell
set noerrorbells

" ================== Styling ========================

if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
	colorscheme solarized
endif
set guifont=consolas:h16
set guioptions=-te
set cursorline

" =================== Misc ==========================

set shiftround
set lbr!
set cmdheight=1
set encoding=utf-8
set ignorecase
set laststatus=2
set ruler
set showmatch
set whichwrap=<,>,[,],b,s " allow these keys to move around at wrapping places
set title
set infercase
set display+=lastline
set nolazyredraw
" Don’t show the intro message when starting vim
set shortmess=atI

nmap \\ <C-]>
let mapleader=","
let g:sparkupExecuteMapping='<D-e>'

nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Return to normal mode on FocustLost
au FocusLost * call feedkeys("\<C-\>\<C-n>")

" 80-character line coloring
if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"NERDTree Plugin
map <leader>n :NERDTreeToggle<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" auto reload browsers
" :{Chrome|Firefox|Safari|Opera|AllBrowsers}Reload
" :{Chrome|Firefox|Safari|Opera|AllBrowsers}ReloadStart
" :{Chrome|Firefox|Safari|Opera|AllBrowsers}ReloadStop
"autocmd VimEnter * ChromeReloadStart
" and return to MacVim
let g:returnApp = "MacVim"
