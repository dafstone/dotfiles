# Archived Vim Plugins

This document contains vim plugins that were previously commented out in the configuration but may be useful for future evaluation and potential reintegration.

## Completion Systems

### DDC (Deno-based Completion)
```vim
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'LumaKernel/ddc-source-file'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'takkii/Bignyanco'
Plug 'shun/ddc-source-vim-lsp'
Plug 'shun/ddc-vim-lsp'
```
**Status**: Modern alternative completion system, may be worth exploring vs nvim-cmp

## Language Server Protocol (Legacy)
```vim
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
```
**Status**: Replaced by nvim-lspconfig for Neovim

## Language Support
```vim
Plug 'pangloss/vim-javascript'     " Javascript Bundle for VIM
Plug 'vim-ruby/vim-ruby'           " Ruby language support
Plug 'fatih/vim-go'                " Vim Go Support (replaced by ray-x/go.nvim)
Plug 'kballard/vim-swift'          " Swift language support
Plug 'elixir-lang/vim-elixir'      " Elixir Language Support
Plug 'hashivim/vim-terraform'      " Terraform support
Plug 'juliosueiras/vim-terraform-completion'  " Terraform completion
```
**Status**: Language-specific plugins that could be re-enabled as needed

## Navigation and Movement
```vim
Plug 'ray-x/navigator.lua'         " Advanced LSP navigation (currently disabled)
Plug 'Lokaltog/vim-easymotion'     " Quick Movement for Movers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'            " FZF integration (alternative to telescope)
```
**Status**: Navigator.lua is partially integrated but disabled; FZF is solid alternative to Telescope

## Development Tools
```vim
Plug 'dense-analysis/ale'          " Asynchronous Lint Engine
Plug 'tpope/vim-fugitive'          " Git commands (should be re-enabled)
Plug 'scrooloose/nerdcommenter'    " Comment Management
Plug 'tpope/vim-rails'             " Rails powerup
Plug 'tpope/vim-ragtag'            " Tag completion goodness
Plug 'tpope/vim-endwise'           " Auto-End for VIM
Plug 'tpope/vim-repeat'            " Enhanced repeat functionality
Plug 'jiangmiao/auto-pairs'        " Auto Pairing (replaced by nvim-autopairs)
Plug 'nathanaelkane/vim-indent-guides'  " Indent Guides (replaced by indent-blankline)
```
**Status**: Many of these are solid plugins that could be re-evaluated

## File and Project Management
```vim
Plug 'moll/vim-node'               " Node powertools
Plug 'groenewege/vim-less'         " Vim LESS Support
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}  " Nginx syntax
Plug 'chrisbra/csv.vim'            " CSV file handling
Plug 'dsawardekar/wordpress.vim'   " Wordpress Utilities
```
**Status**: Project-specific tools that could be useful for certain workflows

## Visual and Interface
```vim
Plug 'rafi/awesome-vim-colorschemes'  " Collection of colorschemes
Plug 'Shougo/context_filetype.vim'    " Context-aware filetype detection
Plug 'vim-airline/vim-airline'        " Status line (currently active)
Plug 'vim-airline/vim-airline-themes' " Airline themes (currently active)
Plug 'Shougo/echodoc.vim'             " Function signatures in echo area
```
**Status**: Visual enhancements, some may be redundant with current setup

## Git Integration
```vim
Plug 'zivyangll/git-blame.vim'     " Git blame functionality
Plug 'rhysd/git-messenger.vim'     " Git commit message viewer
```
**Status**: Git workflow enhancements that could complement existing git tools

## Build and Dependencies
```vim
Plug 'Shougo/neoinclude.vim'       " Include completion
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }  " Go completion (outdated)
```
**Status**: Mostly superseded by LSP and modern completion

## AI and Modern Tools
```vim
Plug 'madox2/vim-ai'               " AI integration (commented out, replaced by codecompanion)
```
**Status**: Alternative AI integration option

## Evaluation Notes

### High Priority for Reintegration
- `tpope/vim-fugitive` - Essential git integration
- `tpope/vim-commentary` - Better than nerdcommenter
- `junegunn/fzf.vim` - Solid alternative to telescope

### Medium Priority
- `ray-x/navigator.lua` - Already partially integrated, worth completing
- Language-specific plugins as needed for projects
- `dense-analysis/ale` - If additional linting beyond LSP is needed

### Low Priority
- Legacy completion systems (DDC)
- Older language servers (vim-lsp)
- Visual enhancements that overlap with current setup

## Future Integration Process

When considering reintegrating any of these plugins:

1. **Check compatibility** with current nvim version
2. **Evaluate overlap** with existing functionality
3. **Test in isolation** before adding to main config
4. **Document configuration** requirements
5. **Update this archive** with results

Last updated: 2025-10-02