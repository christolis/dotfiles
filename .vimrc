syntax on
let g:python_recommended_style = 0
set t_Co=256
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set background=dark
set nocompatible
set wildignore+=*/.yarn-cache/*,*/.vscode/*,*/bin/*,*/obj/*,*/node_modules/*,*/.git/*
set autoread " So that when we get disk writes it updates on open vim instances
set completeopt-=preview
set laststatus=2
set secure
set exrc
set encoding=utf-8
set formatoptions+=r
setglobal fileencoding=utf-8
set nohidden
set nohlsearch
set copyindent

set smartindent
set breakindent
set nowrap
set scrolloff=5
set sidescrolloff=5
set ttyfast
set noerrorbells
set incsearch
set smartcase
set showmatch
set diffopt=filler,iwhite
set history=1000
set undolevels=1000
set nobackup
set noswapfile
set title
set number
set shortmess+=Ia
set ttimeoutlen=0
set magic
set pastetoggle=<F2>
set backspace=indent,eol,start
set whichwrap=h,l,~,[,]
set signcolumn=no

" Packages
packadd YouCompleteMe
packadd ctrlp
packadd editorconfig-vim
packadd vim-airline

" Nerdtree
packadd nerdtree
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:ctrlp_working_path_mode = 'a'
filetype indent on

" Moves the cursor visually, not by line
nnoremap j gj
nnoremap k gk

" Save the file as root without reopening vim
cmap w!! w !sudo tee % >/dev/null

" Return to old position when reopening files
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
 
" Set the color theme
color peachpuff

" Tab switching
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" For switching between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" For python ycm
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" For java ycm
let g:ycm_java_binary_path = '/usr/bin/java'
nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
let g:ycm_key_invoke_completion = '<C-z>'
" let g:ycm_auto_trigger = 1 

" For viewing git diff.
" Instructions: Press the '\' key then type gd to trigger this.
function! GitDiff()
    :silent execute '!git diff --color=always | less -R'
    :redraw!
endfunction
nnoremap <leader>gd :call GitDiff()<CR>

let g:twid = 0
let g:twjob = 0
function! RunGradlew()
    let wid = win_getid()
    botright term ./gradlew spotlessApply run

    " Now we're in the terminal buffer
    let g:twid = win_getid()
    resize 20
    call win_gotoid(wid)
endfunction

function! StopGradlew()
    let twid = win_getid()
    call win_gotoid(g:twid)
    quit!
    call win_gotoid(twid)
endfunction

" For running and stopping Gradle project
" Instructions: Press the '\' key then type rgp to trigger this.
nnoremap <leader>rgp :call RunGradlew()<CR>
nnoremap <leader>sgp :call StopGradlew()<CR>
