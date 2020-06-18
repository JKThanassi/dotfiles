set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'shime/vim-livedown'           , {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim'            , {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': './install --bin' },
Plug 'ryanoasis/vim-devicons',
Plug 'junegunn/fzf.vim',
Plug 'tpope/vim-surround',
Plug 'majutsushi/tagbar'

call plug#end()
syntax enable
set background=light
colorscheme solarized


let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" NERDTREE {{{
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
