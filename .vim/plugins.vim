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
" Plug 'kien/ctrlp.vim'                   " Ctrl-P Fzzy Finder - replaced by Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
" Plug 'madox2/vim-ai'

Plug 'nvim-lua/plenary.nvim'
Plug 'olimorris/codecompanion.nvim'

" Completion Engine
Plug 'hrsh7th/nvim-cmp'           " Main completion engine
Plug 'hrsh7th/cmp-nvim-lsp'       " LSP completions
Plug 'hrsh7th/cmp-buffer'         " Buffer completions
Plug 'hrsh7th/cmp-path'           " Path completions
Plug 'L3MON4D3/LuaSnip'           " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'   " Snippet completions

" Additional plugins - see docs/plugins-archive.md for full list of archived plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'               " Surrounding
Plug 'plasticboy/vim-markdown'          " markdown syntax
Plug 'mhinz/vim-startify'               " Start Screen
Plug 'airblade/vim-gitgutter'           " Gitgutter
Plug 'iberianpig/tig-explorer.vim'      " Tig in vim

" Future consideration: ray-x/navigator.lua (advanced LSP navigation)

call plug#end()



