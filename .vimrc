" junior's vimrc settings
" Author and maintainer: juscah junior.usca@gmail.com
" Public backup: http://github.com/juniorUsca/vimrc
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
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
" Use tabline insted of airline
"Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
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
"Plug 'wlangstroth/vim-racket'
"Plug 'tfnico/vim-gradle'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-endwise'
"Plug 'alvan/vim-closetag'
"Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'leafgarland/typescript-vim'
Plug 'wavded/vim-stylus'
Plug 'shawncplus/phpcomplete.vim'

" Colorschemes
Plug 'cschlueter/vim-wombat'
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

set t_Co=256

" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=80
   silent! color wombat
endif

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
    " silent! color wombat256
    " silent! color pablo
    silent! color Tomorrow-Night-Bright
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

" air-line

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" =====================
" 6. MAPS AND FUNCTIONS
" =====================

" Fix Alt detect key to
" Vim Move
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Mapleader
let mapleader=","

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Multi cursor config default
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Working with buffers is cool.
map <A-n>  :bnext<CR>
map <A-p>  :bprevious<CR>
imap <A-n> <Esc>:bnext<CR>a
imap <A-p> <Esc>:bprevious<CR>a

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a

" NerdTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=20

" My leader commands
" nnoremap <C-b> :center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.
"nnoremap <leader><C-b> :center 80<cr>hhv0lr*A<space><esc>40A*<esc>d79<bar>Ypp80hlv80lr*kk.hi/<esc>lxjjA/<esc>
"nnoremap <leader><C-e> :center 80<cr>hhv0lr*A<space><esc>40A*<esc>d79<bar>80hi/<esc>lxA/<esc>
"nnoremap <leader><C-B> :center 80<cr>0vr=A<esc>40A<space><esc>a=<esc>d79<bar>Ypp<esc>0v80lr=kk.xxi/*<esc>jj$xxa*/<esc>
nnoremap <leader><S-b> _i=<esc>l12i<space><esc>12A<space><esc>a=<esc>Ypp_v$r=$xxa*/<esc>kk_v$r=_xxi/*<esc>j$h12h
"nnoremap <leader><S-e> _i/*=<esc>l12i<space><esc>12A<space><esc>a=<esc>Ypp_v$r=$xxa*/<esc>kk_v$r=_xxi/*<esc>j$h12h
nnoremap <leader><S-e> _i/*<esc>5a=<esc>2a<space><esc>aEnd<space>of<space><esc>$2a<space><esc>6a=<esc>a*/<esc>10h
nnoremap <leader><C-b> Ypppp<esc>kkkk_i=<esc>l12i<space><esc>12A<space><esc>a=<esc>Ypp_v$r=$xxa*/<esc>kk_v$r=_xxi/*<esc>jjjjjj_iEnd<space>of<space><esc>_i/*<esc>5a=<esc>2a<space><esc>$2a<space><esc>6a=<esc>a*/<esc>k0Dkk0Dj_Da
" :echo((80+col('.'))/2)<CR>

" NERDCOMMENTS
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>
imap <F7> <ESC><leader>c<space>a


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
