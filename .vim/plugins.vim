set encoding=utf-8
scriptencoding utf-8

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'ray-x/aurora'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'scrooloose/nerdtree'              " file management
Plug 'mileszs/ack.vim'                  " Finally moving to ack.vim as ag.vim is depricated.
Plug 'neovim/nvim-lspconfig'              " LSP Support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/go.nvim'                      
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'kien/ctrlp.vim'                   " Ctrl-P Fzzy Finder
" Plug 'madox2/vim-ai'

Plug 'nvim-lua/plenary.nvim'
Plug 'olimorris/codecompanion.nvim'

" Plug 'ray-x/navigator.lua'

" ddc-vim
" Plug 'Shougo/ddc.vim'
" Plug 'vim-denops/denops.vim'
" Plug 'Shougo/ddc-ui-native'
" Plug 'Shougo/ddc-around'
" Plug 'Shougo/ddc-matcher_head'
" Plug 'Shougo/ddc-sorter_rank'
" Plug 'LumaKernel/ddc-source-file'
" Plug 'Shougo/neco-vim'
" Plug 'Shougo/neco-syntax'
" Plug 'takkii/Bignyanco'
" Plug 'shun/ddc-source-vim-lsp'
" Plug 'shun/ddc-vim-lsp'

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'pangloss/vim-javascript' "Javascript Bundle for VIM

" Look & Feel (look-and-feel.vim)
" Plug 'rafi/awesome-vim-colorschemes'

" Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh'  }
" Plug 'vim-ruby/vim-ruby'
" Plug 'Shougo/context_filetype.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'dense-analysis/ale'
" Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/neoinclude.vim'
" Plug 'tpope/vim-fugitive'               " git commands
" Plug 'scrooloose/nerdcommenter'         " Comment Management
" Plug 'tpope/vim-rails'                  " rails powerup
" Plug 'tpope/vim-ragtag'                 " tag completion goodness
Plug 'tpope/vim-surround'               " Surrounding
" Plug 'tpope/vim-endwise'                " Auto-End for VIM
" Plug 'tpope/vim-repeat'                 " Auto-End for VIM
Plug 'plasticboy/vim-markdown'          " markdown syntax
" Plug 'moll/vim-node'                    " Node powertools
" Plug 'Lokaltog/vim-easymotion'          " Quick Movement for Movers
" Plug 'groenewege/vim-less'              " Vim LESS Support
" Plug 'fatih/vim-go'                     " Vim Go Support
" Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'mhinz/vim-startify'               " Start Screen
Plug 'airblade/vim-gitgutter'           " Gitgutter
" Plug 'chrisbra/csv.vim'
" Plug 'kballard/vim-swift'
" Plug 'elixir-lang/vim-elixir'           " Elixir Language Support
" Plug 'jiangmiao/auto-pairs'             " Auto Pairing
" Plug 'nathanaelkane/vim-indent-guides'  " Indent Guides
" Plug 'dsawardekar/wordpress.vim'        " Wordpress Utilities (Including Direct Hook to WP-CLI)
Plug 'iberianpig/tig-explorer.vim'      " Tig in vim
" Plug 'hashivim/vim-terraform'
" Plug 'juliosueiras/vim-terraform-completion'
" Plug 'zivyangll/git-blame.vim'
" Plug 'rhysd/git-messenger.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
" Plug 'junegunn/fzf.vim'

call plug#end()



