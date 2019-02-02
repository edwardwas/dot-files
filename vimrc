set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'DoxygenToolkit.vim'
Plugin 'munshkr/vim-tidal'
Plugin 'rhysd/vim-clang-format'
Plugin 'LnL7/vim-nix'
Plugin 'raichoo/purescript-vim'
Plugin 'jceb/vim-orgmode'
Plugin 'Raimondi/delimitMate'
Plugin 'a.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bkad/CamelCaseMotion'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'reedes/vim-pencil'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Align'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'venantius/vim-cljfmt'

call vundle#end() 

set background=dark
colorscheme solarized
set laststatus=2
set hidden
syntax on;
filetype indent on
filetype plugin indent on 

let g:airline_powerline_fonts = 1
let g:airline_theme = 'kalisi'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -L ~/.local/lib -I ~/.local/include'

set expandtab
set tabstop=2
set shiftwidth=4

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

imap jk <Esc>

let g:tmuxline_preset = {
    \'a' : '#S',
    \'b' : '#W',
    \'z' : '#h',
    \'y' : 'CPU: #{cpu_percentage}'}

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:cabal_indent_section = 2

let g:tex_conceal = ""

let g:rustfmt_autosave = 0

noremap <F5> :w <CR> :! make <CR>

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au FileType * RainbowParenthesesLoadRound
au FileType * RainbowParenthesesLoadBraces
au FileType * RainbowParenthesesLoadSquare
au FileType * RainbowParenthesesActivate
