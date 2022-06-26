set hidden
set nocompatible
set encoding=utf-8
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set number relativenumber
set nocp
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:mapleader=" "
syntax on
filetype plugin on

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'wakatime/vim-wakatime'
call plug#end()

colorscheme onedark

noremap <silent> <C-f> :Files<CR>
noremap <silent> <leader>f :Rg<CR>
noremap <silent> <leader>b :Buffers<CR>
noremap <silent> <leader>h :History<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap <Left> <NOP>
noremap <silent> <leader>z :NERDTreeToggle<CR>
noremap <esc><esc> :noh<return><esc>
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-exapnd-jump', ''])\<CR>)" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
