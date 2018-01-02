if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-sandwich'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'rhysd/vim-grammarous'
Plug 'reedes/vim-pencil'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'ajh17/VimCompletesMe'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
call plug#end()

set relativenumber number
set laststatus=2
set noshowmode

colorscheme nord

autocmd BufRead,BufNewFile *.py noremap <buffer> <F7> :exec 'w !python' shellescape(@%, 1)<cr>
inoremap jj <Esc>`^

let python_highlight_all = 1
let g:airline_powerline_fonts = 1

set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

autocmd FileType python setlocal completeopt-=preview

let g:airline#extensions#tabline#enabled = 1
let g:vimtex_view_method = 'zathura'

autocmd BufRead,BufNewFile *.tex setlocal spell

autocmd BufRead,BufNewFile *.tex,*.ref noremap <buffer> <F7> :PencilToggle <cr>

let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_view_method = 'zathura'
