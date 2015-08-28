" Dan Stone (dan@evolvingmedia.net) vim configuration file

" Use Vim settings, rather than Vi settings (much better!).

set nocompatible                        " original vi has nothing to do with my world
filetype off                            " no legacy filetype handling
set relativenumber                      " turn on relative numbers
set noswapfile                          " turning off swapfiles

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set t_Co=256

" Not used yet - setting up numbertoggles

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Plugins

Plugin 'tpope/vim-fugitive'               " git commands
Plugin 'scrooloose/nerdtree'              " file management
Plugin 'tpope/vim-rails.git'              " rails powerup
Plugin 'tpope/vim-ragtag.git'             " tag completion goodness
Plugin 'tpope/vim-surround'               " Surrounding
Plugin 'httplog'                          " http syntax highlighting
Plugin 'terryma/vim-multiple-cursors'     " allows for multiple cursor usage
Plugin 'plasticboy/vim-markdown'          " markdown syntax
Plugin 'altercation/vim-colors-solarized' " Solarized Colors
Plugin 'rking/ag.vim'                     " Adding Silver Searcher - note this must also be installed on the system
Plugin 'moll/vim-node'                    " Node powertools
Plugin 'kien/ctrlp.vim'                   " Node powertools
Plugin 'Lokaltog/vim-easymotion'          " Quick Movement for Movers
Plugin 'groenewege/vim-less'              " Vim LESS Support
Plugin 'fatih/vim-go'                     " Vim Go Support
Plugin 'shougo/neocomplete.vim'           " Vim neocomplete
Plugin 'scrooloose/syntastic'             " Inline Syntax Checking
Plugin 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plugin 'mhinz/vim-startify'               " Start Screen
Plugin 'airblade/vim-gitgutter'           " Gitgutter
Plugin 'christoomey/vim-tmux-navigator'

" PHP & Wordpress
Plugin 'StanAngeloff/php.vim'             " PHP Syntax
Plugin 'shawncplus/phpcomplete.vim'       " PHP OmniCompletion
Plugin 'dsawardekar/wordpress.vim'        " Wordpress Utilities (Including Direct Hook to WP-CLI)

" JavaScript
" Plugin 'jelera/vim-javascript-syntax'     " js syntax
Plugin 'pangloss/vim-javascript'          " Alternate JS Syntax
Plugin 'mxw/vim-jsx'                      " JSX

" Anisble
Plugin 'chase/vim-ansible-yaml'

let g:syntastic_javascript_checkers = ['jsxhint']

" If ITerm2 Session Found Set statusline accordingly

if empty($ITERM_SESSION_ID)
  set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
else
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
endif

" HTML Tidy (requires tidy on the system)

:command Thtml :%!tidy -q -i --show-errors 0
let g:syntastic_html_tidy_ignore_errors = [ 'content occurs after end of body' ]

" Search Configuration

set ignorecase		" Case Insensitivity
set smartcase		" Unless explict match
filetype plugin indent on

" Colorscheme Compatiblility
let g:solarized_termcolors=256

" Set autoreading to on

set autoread
au CursorHold * checktime

" allow backspacing over everything in insert mode

syntax on															" syntax on for good
set nobackup													" keep no backup file flying free
set history=50												" keep 50 lines of command line history
set ruler															" show the cursor position all the time
set showcmd														" display incomplete commands
set incsearch													" do incremental searching
set showcmd														" Show incomplete commands
set showmode													" Display the Mode
set backspace=indent,eol,start				" Nice Backspaceing

" Force Defaults to UTF-8

set encoding=utf-8
set fileencoding=utf-8

" Search Configuration

set ignorecase												" Case Insensitivity
set smartcase													" Unless explict match
set incsearch													" Highlight Matching as I type
set hlsearch													" Highlight Matches

" Other

set expandtab													" Set to use spaces not tabs
set title															" Set the terminal title
set autoindent												" autoindent on CR
set copyindent												" copy previous indenting
set tabstop=2													" Global Tab Width
set shiftwidth=2										" number of spaces for auto-indent
set laststatus=2											" Show the statusline all the time
set hidden														" handle multiple buffers better

" StatusLine Config

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Enable Mouse Support with SGR (xterm 1006 mouse support for more lines)

set mouse+=a
if has("mouse_sgr")
  set ttymouse=sgr
elseif
  set ttymouse=xterm2
endif

" CtrlP Configuration

hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_map = '<c-p>'
nnoremap <C-b> :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|web/wp\|web/app/plugins\|web/app/mu-plugins\|web/app/uploads',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
" set wildignore+=*/tmp/*,*/node_modules/*

" NERDTree Configuration 

let NERDTreeShowHidden=1

" VIM-Markdown Configuration

let g:vim_markdown_folding_disabled=1

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" OmniCompletion
set omnifunc=syntaxcomplete#Complete

" Enable OmniCompletion

" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NeoComplete Configuration
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" inoremap <expr><C-g>  neocomplete#undo_completion()
" inoremap <expr><C-l>  neocomplete#complete_common_string()
" inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Custom Commands
function Slack() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' | slacker -c emn-slack-ops')
endfunction

com -range=% -nargs=0 Slack :<line1>,<line2>call Slack()


nnoremap <Leader>n :NERDTree<CR>                        " NERDTree sidebar.
nnoremap <Leader>/ :noh<CR>                        " Clear Search
nnoremap <Leader>q :tabp<CR>                        " Clear Search
nnoremap <Leader>w :tabn<CR>                        " Clear Search
nnoremap <Leader>r :so $MYVIMRC<CR>                        " Clear Search


" Colorscheme

set background=dark
colorscheme solarized
