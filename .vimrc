" Vimscript file seetings
" global setting {{{:
let mapleader = ","
let maplocalleader = "\\"
" }}}

"active pathogen{{{
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
"}}}
"NerdTree{{{
noremap <F3> :NERDTreeToggle<cr>
let NERDTreeWinSize=20
"}}}
"vim-airline{{{
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
""解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"设置中文提示
language messages zh_CN.utf-8 
"设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
let g:airline_powerline_fonts = 1 
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_left_alt_sep='>'
  let g:airline_right_alt_sep='<'
  let g:airline#extensions#disable_rtp_load = 1
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.maxlinenr = '㏑'
let g:airline_theme="bubblegum"
" 打开后可以显示窗口tab和buffer
let g:airline#extensions#tabline#enabled = 1 
"}}}
" syntastic{{{
"python requires either flake8 or pylint to be installed and in your $PATH
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:syntastic_python_checkers = ['pyflakes']
nnoremap <leader>ll :lclose<cr>
"let g:syntastic_python_checkers = ['python3']
"}}}
" vim-multiple-cursors {{{
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
"}}}
" super-tab {{{
let g:SuperTabCompleteCase = "ignore"
"}}}

" personal abbreviation {{{
inorea @@@ nevermoretp@163.com
inorea __au #__author__: Chris.T
inorea ccopy Copyright 2018 Chris.T, all rights reserved. 
" }}}

" personal setting: {{{
colorscheme desert
set nobackup
set noundofile
syntax on
set background=light
set tabstop=4
set softtabstop=4
"force to no ignore case, evade mistakes.
set shiftwidth=4
set noignorecase
set expandtab
set number
set numberwidth=4
" show brackets match, and no time interval
set showmatch
set matchtime=0
" set highlight searching
set hlsearch
set incsearch
" set statusline
" always has a statusline
" set laststatus=2
" standard statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" make paste easily
"set paste
" 开启光亮光标行 
set cursorline
hi CursorLine cterm=bold ctermfg=None ctermbg=235
"hi CursorLine cterm=bold ctermfg=white guibg=darked guifg=white
set cursorcolumn
hi CursorColumn cterm=bold ctermfg=None ctermbg=235
"set mouse in all mode
set mouse=""
" }}}

" my auto-commands {{{
augroup mygroup
    autocmd!
    autocmd BufWritePre,BufRead *.html :normal gg=G
    autocmd BufNewFile,BufRead *.html setlocal nowrap
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType python setlocal foldmethod=indent

	autocmd FileType vim :inorea <buffer> func function ()<cr>endfunction<esc>k1hi<bs>
	autocmd FileType vim :inorea <buffer> fun! function! ()<cr>endfunction<esc>k1hi<del>
	autocmd FileType vim :inorea <buffer> function NOPENOPENOPE
	autocmd FileType vim  vnoremap <leader>/ :s/^/"/g<cr> :let @/=""<cr>
	autocmd FileType vim  vnoremap <leader>? :s/^"//g<cr> :let @/=""<cr>

	autocmd FileType *sh vnoremap <leader>/ :s/^/#/g<cr> :let @/=""<cr>
	autocmd FileType *sh vnoremap <leader>? :s/^#//g<cr> :let @/=""<cr>

"    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
"    autocmd FileType python inoremap <buffer> ' ''<esc>i
"    autocmd FileType python inoremap <buffer> " ""<esc>i
"    autocmd FileType python inoremap <buffer> ( ()<esc>i
"    autocmd FileType python inoremap <buffer> [ []<esc>i
	autocmd FileType python vnoremap <buffer> <leader>/ :s/^/#/g<cr> :let @/=""<cr>
	autocmd FileType python vnoremap <buffer> <leader>? :s/^#//g<cr> :let @/=""<cr>
    autocmd FileType python :inorea <buffer> def def ():<esc>2hi<bs>
    autocmd FileType python :inorea <buffer> class class (object):<esc>8hi<bs>
	autocmd FileType python :inorea <buffer> __if if __name__ == '__main__':<esc>o

    autocmd FileType c noremap <f5> :w<cr> :!gcc -g % -o out<cr>  :!./out<cr>
    autocmd FileType cpp noremap <f5> :w<cr> :!g++ % -o out<cr> :!./out<cr>
	autocmd FileType c vnoremap <leader>/ :s/^/\/\//g<cr> :let @/=""<cr>
	autocmd FileType cpp vnoremap <leader>/ :s/^/\/\//g<cr> :let @/=""<cr>
	autocmd FileType c vnoremap <leader>? :s/^\/\///g<cr> :let @/=""<cr>
	autocmd FileType cpp vnoremap <leader>? :s/^\/\///g<cr> :let @/=""<cr>
	autocmd BufNewFile *.py :1s/^$/#!\/usr\/bin\/env python3\r#-\*- coding: utf-8 -\*-/g
augroup END

"" goto the position last read.
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
endif

""}}}

" customize mapping {{{
" turn off the hilighting smoothly
nnoremap <leader>hi mx :let @/=''<cr> `x
" paste normally
nnoremap <leader>p :set paste<cr>
" return to nopaste patter
nnoremap <leader>P :set nopaste<cr>
" move a line downword
nnoremap - ddp
" move a line upword
nnoremap _ ddkkp
" 'very magic' searching pattern
nnoremap <buffer> / /\v\c
nnoremap <buffer> ? ?\v
" close highlight search
"nnoremap <leader>h :set nohlsearch<cr>
" uppercase current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> <esc>viwUe
" delete current line easily
inoremap <c-d> <esc>ddi
" open and source .vimrc quickly
nnoremap <leader>ev :60vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" quit quickly
nnoremap <leader>ss :w<cr> :source %<cr>
"open the last buffer
nnoremap <leader>la :execute "rightbelow vsplit " . bufname("#")<cr>
" ban some default keys, and move fast
inoremap jk <esc>
"inoremap jj <esc>ji
"inoremap kk <esc>ki
inoremap <c-j> <esc>i
inoremap <c-k> <esc>la
noremap <c-e> <end>
noremap <c-a> <home>
"inoremap <right> <nop> 
"inoremap <left> <nop> 
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <right> <nop>
"nnoremap <left> <nop>
"split navigations
nnoremap <down> <C-W><C-J>
nnoremap <up> <C-W><C-K>
nnoremap <right> <C-W><C-L>
nnoremap <left> <C-W><C-H>
" force the text in the center of your screen
inoremap <cr> <cr><esc>zzi
" insert to the end/start of line easily
"inoremap aa <esc>A
"inoremap ii <esc>I
"resize windows quickly
nnoremap <c-up> :vertical-resize +5<cr>
nnoremap <c-down> :vertical-resize -5<cr>
nnoremap <c-right> :resize +5<cr>
nnoremap <c-left> :resize -5<cr>
" move buffers faster
nnoremap <c-j> :w<cr> :bn<cr>
nnoremap <c-k> :w<cr> :bp<cr>
" execute list command
nnoremap <leader>li :%li<cr>
" quickly wrap the words with apostrophe
nnoremap <leader>' bi'<esc>wwi'<esc>
nnoremap <leader>n :lnext<cr>
nnoremap <leader>N :lprevious<cr>
" }}}

" important demos for study{{{
" [demo]how to record current position
" execute "normal! mqA;\<esc>`q"

" [demo]show trailing spaces. Notice: 'match'  is a typically useful command to help you check some syntax errors or such stuffs.By the way, to clear the match, run: nnoremap <leader>W :match<cr>
" nnoremap <leader>w :match Error /\v $/

" [demo]Grep Operator
"nnoremap <leader>g :silent execute "grep! -R ".shellescape(expand("<cWORD>"))." ."<cr>:copen 15<cr>
"}}}

