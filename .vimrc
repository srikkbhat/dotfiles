set nocompatible

" required
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"leader n
Plugin 'scrooloose/nerdtree'

"solarized colors for vim
Plugin 'altercation/vim-colors-solarized'

"surround for paranthesis
Plugin 'tpope/vim-surround'

"File switch from on to another
"ctrl-p opens ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'

"snippets
Plugin 'SirVer/ultisnips'

"syntastic - syntax checker
Plugin 'scrooloose/syntastic'

"STL syntax - syntax highlighting for c++ STL
Plugin 'Mizuchi/STL-Syntax'

"ack vim
Plugin 'mileszs/ack.vim'

"airline
Plugin 'bling/vim-airline'

"undo tree
Plugin 'mbbill/undotree'

"delimit mate
Plugin 'Raimondi/delimitMate'

"tComment
Plugin 'tomtom/tcomment_vim'

"Google color scheme
Plugin 'google/vim-colorscheme-primary'

call vundle#end()            " required
filetype plugin indent on    " required

"g++ -ggdb -Wall -pipe -std=c++11 -O2 -DLOCAL
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ggdb -Wall -std=c++11   -O2  -DLOCAL  % -o %:r && ./%:r <CR>

let mapleader=','

"spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab

" Useful settings
set history=100
set undolevels=700

"Display the line number
set number
set numberwidth=1 " using only 1 column (and 1 space) while possible

set nowrap " don't automatically wrap on load
set tw=119 " width of document (used by gd)
set fo-=t " don't automatically wrap text when typing

"VERTICAL LINE
set colorcolumn=120
highlight ColorColumn ctermbg=233

set t_Co=256
syntax enable
set background=dark
"colorscheme primary

"solarized
colorscheme solarized

set ruler " show the cursor position all the time
set title " show title in console title bar

" Status line config
set laststatus=2 "Always show the status line

set autoindent
set smartindent
set cindent
set autoread " Reload files when changed

" Set code folding method
set foldmethod=syntax
set foldlevel=119

" When setting showcmd, the bottom line will show you information about the
" current command going on
set showcmd

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Highlight the current line
set cursorline

"Highlight the search result and incremental search
set hlsearch
set incsearch
set ignorecase
set smartcase

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

set grepprg=ack " replace the default grep program with ack

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamedplus

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"split screen navigation made easy
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j

vnoremap <c-c> "+y

" easier moving between tabs
"map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"yank entire file
map <Leader>y :%y+<CR>

"easier moving between buffers
map gt :bnext<CR>


"Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
" Remove trailing whitespace on <leader>ss
nnoremap <leader>ss :call StripWhitespace()<CR>


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_always_populate_location_list = 1
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

"let g:SuperTabDefaultCompletionType = '<C-n>'

"remap ultisnip expand
let g:UltiSnipsExpandTrigger = "<C-j>"
"let g:UltiSnipsJumpForwardTrigger = "<C-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/snips"
let g:UltiSnipsSnippetDirectories = ["snips"]


" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

"ctrlp options
let g:ctrlp_root_markers=['pom.xml', 'bower.json', 'package.json', 'gulpfile.js']

" Ack searching
nmap <leader>a <Esc>:Ack!

"Open undotree
map <leader>g :UndotreeToggle<cr>

"t comment
map <c-/> :TComment<cr>

"ignores
let NERDTreeIgnore=['\~$', '\.pyc', '\.swp$', '\.git', '\.hg', '\.svn',
      \ '\.ropeproject', '\.o', '\.bzr', '\.ipynb_checkpoints$',
      \ '__pycache__', 'dist$', 'tmp$',
      \ '\.egg$', '\.egg-info$', '\.tox$', '\.idea$', '\.sass-cache',
      \ '\.env$', '\.env[0-9]$', '\.coverage$', '\.tmp$', '\.gitkeep$',
      \ '\.coverage$', '\.webassets-cache$', '\.vagrant$', '\.DS_Store',
      \ '\.env-pypy$']

set wildignore+=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
set wildignore+=.env,.env[0-9]+,.env-pypy,.tmp,.coverage,*.gem,*DS_Store*
set wildignore+=.sass-cache/,__pycache__/,.webassets-cache/
set wildignore+=vendor/rails/**,vendor/cache/**
set wildignore+=.git/**,.gitkeep
set wildignore+=log/**,tmp/**,dist/**,.tox/**,.idea/**
set wildignore+=.vagrant/**,.coverage/**,*/.nx/**,*.app"
set wildignore+=*.egg,*.egg-info,*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
