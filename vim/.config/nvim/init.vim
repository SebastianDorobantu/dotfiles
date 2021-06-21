"  +----------------------------------------------+
"  | NEOVIM CONFIG FILE ---by-Sebastian-Dorobantu |
"  +----------------------------------------------+


filetype plugin indent on
syntax on


"##########################################-SETS-#######################################
set exrc
set hidden
set expandtab
set autochdir
set autoindent
set smartindent
set scrolloff=12
set shiftwidth=4
set termguicolors
set encoding=UTF-8
set relativenumber nu
set smartcase ignorecase
set tabstop=4 softtabstop=4
set backspace=indent,eol,start
set undodir=~.config/nvim/undodir
set textwidth=115
set nohlsearch
set noswapfile
set nobackup
set nowrap


set path=.,**

"####################################-PLUGINS-####################################
call plug#begin()

Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
"Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vimwiki/vimwiki'
Plug 'psliwka/vim-smoothie'

call plug#end()

"######-Color highlighting-##########

let g:Hexokinase_highlighters = [ 'foregroundfull','virtual']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

"#######################-For Makeing VimWiki Work-##################################

let g:vimwiki_list = [{'path': '/home/seba/MEGA/wiki'}] " set path to a directory inside Dropbox
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure vimwiki doesn't own all .md files
let g:vimwiki_folding = ''

hi VimwikiHeader6 guifg=#FF0000
hi VimwikiHeader5 guifg=#4FFF1C
hi VimwikiHeader4 guifg=#EEC942
hi VimwikiHeader3 guifg=#77FFFF
hi VimwikiHeader2 guifg=#4970FF
hi VimwikiHeader1 guifg=#A058FF

"####################################-COMMANDS-####################################


command Wq wq
command WQ wq
command Q q


"####################################-Light Line-####################################

set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }


"#######################-Trailing Whitespace Deletor-###############################

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"###################IN PROGRESS############"

" Ctrl Z not stopping vim
nnoremap <c-z> <nop>

" NO MORE ARROW KEYS FOR U

nmap <Down> <nop>
nmap <UP> <nop>
nmap <Left> <nop>
nmap <Right> <nop>

imap <Down> <nop>
imap <UP> <nop>
imap <Left> <nop>
imap <Right> <nop>

inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

vmap <Down> <nop>
vmap <UP> <nop>
vmap <Left> <nop>
vmap <Right> <nop>

nnoremap J <nop>

" Vimwiki ###########
nmap <Leader>vw <Plug>VimwikiIndex

" Lead ww opens vimwiki in split
map <Leader>ww :vsplit<Enter><C-w>l<Plug>VimwikiIndex:vertical resize -18<Enter>

map <Leader>R call RunFile()

" Format text according to textwidth
nnoremap <leader>f gqip


"Open terminal
nmap <Leader>t :split<CR><c-w>j:term <CR>i<c-l>















