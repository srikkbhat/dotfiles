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

"File switch from on to another
"ctrl-p opens ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

"snippets
Plugin 'SirVer/ultisnips'

Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'

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

call vundle#end()            " required
filetype plugin indent on    " required


let mapleader=','

"spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
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

set ruler " show the cursor position all the time
set title " show title in console title bar

" Status line config
set laststatus=2 "Always show the status line

set autoindent
set smartindent
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
set clipboard=unnamed

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"split screen navigation made easy
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

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

"solarized
colorscheme solarized

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

"remap ultisnip expand
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/snips"
let g:UltiSnipsSnippetDirectories = ["snips"]

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"YCM not to use tab key for UtilSnips
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

"Open undotree
map <leader>g :UndotreeToggle<cr>

"t comment
map <c-/> :TComment<cr>
