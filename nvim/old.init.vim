" enable mouse support "
set mouse=a
" keep tabs as tabs, but display as 4-space width "
set softtabstop=4 shiftwidth=4
set noexpandtab
" show tabs for files at the top of screen "
set showtabline=2
" syntax baby "
set syntax=on
" highlight current line "
set cursorline
highlight Cursorline ctermbg=black
" smart indent you fucko "
set smartindent
" show matching pairs of brackets "
set showmatch
" when command '$ nvim .' will source a .vimrc within the dir "
set exrc 
" enable smartcase search sensitivity "
set ignorecase
set smartcase
" show line numbers and relative to cursor location "
set relativenumber
set nu
" always unhighlight after search "
set nohlsearch
" keeps buffers hidden in the background "
set hidden 
" no bellz "
set noerrorbells
" no rapping "
set nowrap
" next four involved with undo history "
set noswapfile "nooooo swappppppfiles
set nobackup
set undodir=~/.vim/undodir
set undofile
" control split directions "
set splitright
set splitbelow
"faster completion (4000ms default) "
set updatetime=300
" show search matches as the search query is being typed "
set incsearch
" lines to pad cursor from window border "
set scrolloff=12
set sidescrolloff=8
" column to the right "
set colorcolumn=80
" height of command pane "
set cmdheight=2
" margin to the left, good for linting "
set signcolumn=yes 
" enables 'true' color support "
set termguicolors

source $HOME/.config/nvim/vim-plug/plugins.vim

set t_Co=256
set background=dark
colorscheme gruvbox
" settings below used to override Terminal bg color "
highlight Normal ctermbg=NONE 
highlight nonText ctermbg=NONE
