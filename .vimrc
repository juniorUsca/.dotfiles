" danirod's vimrc settings
" Author and maintainer: Dani Rodríguez <danirod@outlook.com>
" Public backup: http://github.com/danirod/vimrc
"
" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" Stop acting like classic vi
set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!

" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent              " autoindent always ON.

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" set termguicolors to have true colors
" and to highlight colors with coc
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endi

" Colorscheme configuration.
if &t_Co > 2
	syntax on
	silent! colorscheme gruvbox
    " packadd! onedark.vim
    " colorscheme onedark
    set background=dark

	highlight Folded cterm=reverse ctermbg=0 ctermfg=8
	highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=8
	highlight Conceal cterm=NONE ctermbg=NONE ctermfg=8

	highlight DiffAdd ctermfg=green cterm=bold
	highlight DiffDelete ctermfg=red cterm=bold
	highlight DiffChange ctermfg=yellow

    highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

	set colorcolumn=80

	" Sometimes I see the syntax be out of sync
	noremap <F12> <Esc>:syntax sync fromstart<CR>
	inoremap <F12> <C-o>:syntax sync fromstart<CR>
endif

" Mark trailing spaces depending on whether we have a fancy terminal or not
if &t_Co > 2
	highlight ExtraWhitespace ctermbg=1
	match ExtraWhitespace /\s\+$/
else
	set listchars=trail:~
	set list
endif

" Use a specific pipe ch
set fillchars+=vert:\┊

set mouse=a
set ruler
set showcmd
set clipboard=unnamed

" set noshowmode
set laststatus=1        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

" Search highltight
set hlsearch
nnoremap <CR> :noh<CR>

" Shortcuts for switching the buffers
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
imap <C-N> <Esc>:bnext<CR>i
imap <C-P> <Esc>:bprev<CR>i

" preserver cursor position when switching between buffers
" (NOT working correctly)
" autocmd BufEnter * silent! normal! g`""`

let mapleader=" "

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a

" Double ESC the terminal to exit terminal-job mode.
tnoremap <Esc><Esc> <C-\><C-n>

" A single map for switching wrap mode
set showbreak=…         " on wrap show dots
set linebreak           " wrap no break line in words
nmap <F7> :set invwrap<CR>
imap <F7> <ESC>:set invwrap<CR>a

" tab and shift tab configuration
" nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" paste in a new line
nmap ]p :pu<CR>
nmap [p O<ESC>p

" update runtime
set rtp+=/usr/local/opt/fzf

" modify cursor style
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" set cursorcolumn
set cursorline
set cursorlineopt=number


set listchars=tab:·\ ,trail:·

" in html/xml jump between tags with %
runtime macros/matchit.vim

" spell check
set spelllang=en_us,es
map <F9> :setlocal spell!<CR>
