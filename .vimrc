if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set term=xterm-256color

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-sandwich'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'rhysd/vim-grammarous'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'ajh17/VimCompletesMe'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'reedes/vim-pencil'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
Plug 'machakann/vim-highlightedyank'
call plug#end()

set relativenumber number
set termguicolors
set laststatus=2
set noshowmode
set foldmethod=manual

colorscheme nord
hi visual term=bold,reverse ctermfg=6 ctermbg=8 guifg=#88C0D0 guibg=#4C566A
hi SpellBad term=bold,reverse ctermfg=5 ctermbg=11 guifg=#E5E9F0 guibg=#BF616A

let g:airline#extensions#tabline#enabled = 1

inoremap jj <Esc>`^
:command WQ wq
:command Wq wq
:command W w
:command Q q

let g:airline_powerline_fonts = 1

" python settings
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix
autocmd BufRead,BufNewFile *.py noremap <buffer> <F7> :exec 'w !python' shellescape(@%, 1)<cr>
autocmd FileType python setlocal completeopt-=preview
let python_highlight_all = 1

" .tex file options
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'callback' : 0}
augroup textobj_quote
  autocmd!
  autocmd FileType tex call textobj#quote#init()
  autocmd FileType bib call textobj#quote#init()
augroup END
augroup pencil
  autocmd!
  autocmd FileType tex,bib call pencil#init({'wrap': 'soft'})
augroup END
augroup conceal
  autocmd!
  autocmd FileType tex,bib set conceallevel=0
augroup END
autocmd FileType tex :NoMatchParen
autocmd FileType tex :set spell
autocmd FileType tex :set lazyredraw
au FileType tex setlocal nocursorline

