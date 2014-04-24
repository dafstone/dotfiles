" Dan Stone (dan@evolvingmedia.net) vim configuration file

" Use Vim settings, rather than Vi settings (much better!).

set nocompatible
filetype off
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Plugins

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails.git'
" Plugin 'Lokaltog/vim-easymotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" scripts not on GitHub
" Plugin ':git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" Search Configuration

set ignorecase		" Case Insensitivity
set smartcase		" Unless explict match

filetype plugin indent on     " required

" allow backspacing over everything in insert mode

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

set title															" Set the terminal title
set autoindent												" autoindent on CR
set copyindent												" copy previous indenting
set tabstop=2													" Global Tab Width
set shiftwidth=4											" number of spaces for auto-indent
set laststatus=2											" Show the statusline all the time
set hidden														" handle multiple buffers better

" Stole Eileens Status Line
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P



" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Stone : Commented out existing filetype settings
  "  filetype plugin indent on

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
