" Dan Stone (dan.stone@fgh.com) vim configuration file

" Use Vim settings, rather than Vi settings (much better!).

set nocompatible                        
filetype off                            " no legacy filetype handling
set relativenumber                      " turn on relative numbers
set number                              " but lets see the number I'm on
set noswapfile                          " turning off swapfiles
set t_Co=256

" Initialize vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

runtime plugins.vim

let g:deoplete#enable_at_startup = 1

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_linters_ignore = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['eslint'],
\}


" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})


" If ITerm2 Session Found Set statusline accordingly
if empty($ITERM_SESSION_ID)
  set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
else
  set rtp+=~/Library/Python/3.8/lib/python/site-packages/powerline/bindings/vim
endif
 
" Ale Statusline -- To Come

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction


set statusline=%{LinterStatus()}
 
" Configuration for Ack with AG
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Indent Guide Configuration
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=Grey27 ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=Grey11 ctermbg=236

" HTML Tidy (requires tidy on the system)

:command! Thtml :%!tidy -q -i --show-errors 0
 
" Comment Configuration
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" Search Configuration

set ignorecase		          " Case Insensitivity
set smartcase		            " Unless explict match
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

set title															" Set the terminal title
set autoindent												" autoindent on CR
set tabstop=2													" Global Tab Width
set shiftwidth=2										" number of spaces for auto-indent
set laststatus=2											" Show the statusline all the time
set hidden														" handle multiple buffers better
 
" StatusLine Config

set statusline+=%#warningmsg#
set statusline+=%*

" Enable Mouse Support with SGR (xterm 1006 mouse support for more lines)

set mouse+=a
if has("mouse_sgr")
  set ttymouse=sgr
else
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
set wildignore+=*/tmp/*,*/node_modules/*
 
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


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" OmniCompletion
" set omnifunc=syntaxcomplete#Complete

" Enable OmniCompletion

" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType ruby setlocal  omnifunc=rubycomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType go setlocal omnifunc=go#complete#Complete
" 
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

endif " has("autocmd")
 
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

nnoremap <Leader>n :NERDTree<CR>                    " NERDTree sidebar.
nnoremap <Leader>/ :noh<CR>                         " Clear Search
nnoremap <Leader>q :tabp<CR>                        " Previous tab
nnoremap <Leader>] :tabn<CR>                        " Next Tab
nnoremap <Leader>[ :tabn<CR>                        " Next Tab
nnoremap <Leader>t :ToggleTagbar<CR>                " Next Tab
nnoremap <Leader>v :so $MYVIMRC<CR>                 " Reload Vimrc 
nnoremap <Leader>j :%!python -m json.tool<CR>                 " Reload Vimrc 
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
vmap <C-x> :!reattach-to-user-namespace pbcopy<CR>  
vmap <C-c> :w !reattach-to-user-namespace pbcopy<CR><CR>

" Go Commands

autocmd FileType go noremap<buffer> <Leader>d :GoDoc<CR> <C-w>L<CR> :vertical resize -20<CR>
autocmd FileType go noremap<buffer> <Leader>r :GoRun<CR>
autocmd FileType go noremap<buffer> <Leader>b :GoBuild<CR>

" Colorscheme

colorscheme solarized8
set expandtab													" Set to use spaces not tabs

