" danirod's vimrc settings
" Author and maintainer: Dani Rodrînirod@outlook.com>
" Public backup: http://github.com/danirod/vimrc
"
" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" TABLE OF CONTENTS:
" 1. Generic settings
" 2. Vim-Plug plugins
" 3. File settings
" 4. Specific filetype settings
" 5. Colors and UI
" 6. Maps and functions
" ===================
" 1. GENERIC SETTINGS
" ===================
set nocompatible " disable vi compatibility mode
set history=1000 " increase history size

" =================
" 2. VIM-PLUG PLUGINS
" =================
" Init vim-plug
if has("win32") || has("win64")
    call plug#begin('$USERPROFILE/vimfiles/plugged/')
else
    call plug#begin('~/.vim/plugged/')
end

" Plug-ins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/nerdcommenter'
Plug 'dkprice/vim-easygrep'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'
Plug 'rhlobo/vim-super-retab'
Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'will133/vim-dirdiff'

"""" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'honza/vim-snippets'

" YouCompleteMe is overkill to install unless I actually need it. Uncomment
" if C/C++/Rust is planned to be developer on the machine vimrc is running in.
" Plug 'Valloric/YouCompleteMe'

" Language support
Plug 'wlangstroth/vim-racket'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'leafgarland/typescript-vim'
Plug 'wavded/vim-stylus'
Plug 'shawncplus/phpcomplete.vim'

" Colorschemes
Plug 'cschlueter/vim-wombat'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

" ================
" 3. FILE SETTINGS
" ================

" 70s are over and swap files are part of the past.
" If you need to backup something, use Git, for God's sake.
set noswapfile
set nobackup

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=2            " spaces for autoindenting
set softtabstop=2           " remove a full pseudo-TAB when i press <BS>
set tabstop=4

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" =============================
" 4. SPECIFIC FILETYPE SETTINGS
" =============================

" Some programming languages work better when only 2 spaces padding is used.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml"

"let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc/src"


" ================
" 5. COLORS AND UI
" ================
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=80
   silent! color wombat
endif

" best tomorrow theme or comment next line
colorscheme pablo

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
endif

" Trailing spaces
if &t_Co > 2 || has("gui_running")
    " Because we have color, colourize them
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback
    set listchars=trail:~
    set list
endif

set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
                        " Sauce on this: http://stackoverflow.com/a/9001540

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

if &t_Co >= 256 || has("gui_running")
    set cursorcolumn    " cursor column is fine but only with enough colors
endif

" =====================
" 6. MAPS AND FUNCTIONS
" =====================
let mapleader=","

" Make window navigation less painful.
map <Leader><C-h> <C-w>h
map <Leader><C-j> <C-w>j
map <Leader><C-k> <C-w>k
map <Leader><C-l> <C-w>l

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Working with buffers is cool.
set hidden
map <Leader><C-N>  :bnext<CR>
map <Leader><C-P>  :bprev<CR>
imap <Leader><C-N> <Esc>:bnext<CR>a
imap <Leader><C-P> <Esc>:bprev<CR>a

" Vim Move
let g:move_key_modifier = 'C'

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a

map <Leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=20

" nnoremap <C-b> :center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.
nnoremap <leader><C-b> :center 80<cr>hhv0lr*A<space><esc>40A*<esc>d79<bar>Ypp80hlv80lr*kk.hi/<esc>lxjjA/<esc>
nnoremap <leader><C-e> :center 80<cr>hhv0lr*A<space><esc>40A*<esc>d79<bar>80hi/<esc>lxA/<esc>


" SHIFT TAB BACK
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" dissaprobe more than 5 spaces
" the value need to do equal or more than 5
" need install kannada fonts
let g:LookOfDisapprovalTabTreshold=5
let g:LookOfDisapprovalSpaceTreshold=(&shiftwidth*5)

