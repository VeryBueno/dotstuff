" use vim settings instead of vi settings.
set nocompatible

" indentation things
set tabstop=2
set shiftwidth=3
set smarttab
set expandtab
set softtabstop=3
set autoindent

" synax highlighting
syntax on

" line numbers
set number

" pretty colors
set t_Co=256
colorscheme xoria256

" Color compatibility stuff
if match($TERM, "screen")!=-1
  set term=xterm
endif

" don't autoindent on pastes
set pastetoggle=<F2>

" map jj to Escape on insert mode.
imap jj <Esc>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" make esc work fast
set ttimeoutlen=50

" enable mouse interaction
set mouse=a

" don't beep, just make the terminal flash.
set vb

" a nice tab-completion for vim.
set wildmenu

" ignore things in the wildmenu
set wildignore=*.o,*.obj,*~,*.pyc,*.db
set wildignore+=*.tar.gz,*.zip
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.ico

" save on ctrl+L
nmap <c-L> :w<CR>
imap <c-L> <Esc>:w<CR>a
imap <c-L> <Esc><c-L>

" ignore case on search unless capitals are included
set ignorecase
set smartcase

" realtime search highlighting, like in browsers.
set incsearch

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" minimum number of lines above and below cursor
set scrolloff=3

" show matching brackets
set showmatch

" dictionary completion
au FileType javascript set complete+=k$HOME/.vim/dict/javascript.dict
au FileType html set complete+=k$HOME/.vim/dict/javascript.dict
au FileType python set complete+=k$HOME/.vim/dict/python.dict
let g:SuperTabDefaultCompletionType="context"

iabbrev Lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

execute pathogen#infect()
source ~/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim

" Commonly included scripts
iabbrev jqueryscript <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
iabbrev angularscript <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
iabbrev bootstrapcss <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
iabbrev bootstrapscript <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

" Highlight current line
set cursorline

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Matching brackets, parens
inoremap {<Space>      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap {}     {}

inoremap (<Space>      ()Left>
inoremap (<CR>  (<CR>)<Esc>O<Tab>
inoremap ()     ()

inoremap [<Space>      []Left>
inoremap [<CR>  [<CR>]<Esc>O<Tab>
inoremap []     []

