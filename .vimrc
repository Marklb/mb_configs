set nocompatible  " required
filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install some plugins
"call vundle#being('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note oolder versions of Vundle used Bundle
" instead of Plugin)

" All of your Plugins must be added before 'call vundle#end()
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/powerline', {'trp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/unite.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'kshenoy/vim-signature'  " Need pre-requirements
Plugin 'mhinz/vim-signify'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite-outline'


" Themes
Plugin 'morhetz/gruvbox'
Plugin 'Haron-Prime/Antares'
Plugin 'Haron-Prime/evening_vim'
Plugin 'DrowsySaturn/VIvid.vim'
Plugin 'christophermca/meta5'
Plugin 'dfxyz/CandyPaper.vim'
Plugin 'zanloy/vim-colors-sunburst'
Plugin 'ratazzi/blackboard.vim'
Plugin 'hachy/eva01.vim'
Plugin 'djjcast/mirodark'
Plugin 'ciaranm/inkpot'


call vundle#end() " required
filetype plugin indent on " required


syntax enable " Turn on syntax highlighting
set number " Line numbers
set numberwidth=5
set hidden " Leave hidden buffers open
set history=100 " By default Vim saves your last 8 commands
set backspace=2 " Backspace deletes like most programs in insert mode
set showcmd " Display incomplete commands
set incsearch "Do incremental searching
set hlsearch " Highlight matches
set autoread " Automatically read a file when changed from outside
set autowrite " Automatically :write before running commands
" Reload .vimrc
"map <leader>rr :source ~/.vimrc<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-J>
nnoremap <C-H> <C-W><C-J>

set splitbelow
set splitright

" Switch tabs using Ctrl-t <arrow>
map <C-t><up> :tabr<CR>
map <C-t><down> :tabl<CR>
map <C-t><left> :tabp<CR>
map <C-t><right> :tabn<CR>

" Enable folding
set foldmethod=indent " Fold based on indent
set foldnestmax=1 "Deepest d=fold is 10 levels
"set foldlevel=99
set foldlevel=1
set nofoldenable " Don't fold by default


" Enable folding with the spacebar
nnoremap <space> za

" View docstrings for folded code
let g:SimpylFold_docstring_preview=1

set tabstop=2
set shiftwidth=2
set expandtab

" Pyhton PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent

" Temp fix until I can get chaining file extensions on one line
func! FileSettings_js()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunc

autocmd BufNewFile,BufRead *.js :call FileSettings_js()
autocmd BufNewFile,BufRead *.html :call FileSettings_js()
autocmd BufNewFile,BufRead *.css :call FileSettings_js()
autocmd BufNewFile,BufRead *.coffee :call FileSettings_js()



" Mark extra whitespace as bad and probably color it red
" au BufRead,BufNewFile *.py, *.pyw, *.c, *.h math BadWhiteSpace /\s\+$/

set encoding=utf-8

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

set colorcolumn=79
hi ColorColumn ctermbg=0

hi Folded guibg=darkgrey
hi Folded guifg=grey
hi FoldColumn guibg=darkgrey
hi FoldColumn guifg=grey

" Increment/Decrement number
nnoremap + <C-a>
nnoremap - <C-x>


" YouCompleteMe settings
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this= os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" Pick color scheme based on vim mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set t_co=256
  set background=dark
  colorscheme eva01
endif

" NerdTree settings
" hide .pyc files
let NERDTreeIgnore=['\pyc$', '\~$'] "ignore files in NERDTree
" Open NERDTree with Ctrl-\
map <C-\> :NERDTreeToggle<CR>

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"==================================================
" nerdcommenter
"==================================================
" Default <leader> = \
" [count]<leader>cc |NERDComComment|
" Comment out the current line or text selected in visual mode.
"
" [count]<leader>cn |NERDComNestedComment|
" Same as <leader>cc but forces nesting.
"
" [count]<leader>c<space> |NERDComToggleComment|
" Toggles the comment state of the selected line(s). If the topmost selected
" line is commented, all selected lines are uncommented and vice versa.
"
" [count]<leader>cm |NERDComMinimalComment|
" Comments the given lines using only one set of multipart delimiters.
"
" [count]<leader>ci |NERDComInvertComment|
" Toggles the comment state of the selected line(s) individually.
"
" [count]<leader>cs |NERDComSexyComment|
" Comments out the selected lines ``sexily''
"
" [count]<leader>cy |NERDComYankComment|
" Same as <leader>cc except that the commented line(s) are yanked first.
"
" <leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.
"
" <leader>cA |NERDComAppendComment|
" Adds comment delimiters to the end of line and goes into insert mode between
" them.
"
" |NERDComInsertComment|
" Adds comment delimiters at the current cursor position and inserts between.
" Disabled by default.
"
" <leader>ca |NERDComAltDelim|
" Switches to the alternative set of delimiters.
"
" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
" Same as |NERDComComment| except that the delimiters are aligned down the left
" side (<leader>cl) or both sides (<leader>cb).
"
" [count]<leader>cu |NERDComUncommentLine|
" Uncomments the selected line(s).

"==================================================
" vim-multiple-cursors
"==================================================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-f>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<ESC>'
" Called once before starting multiple cursor selection
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
        exe 'NeoCompleteLock'
    endif
endfunction
" Called once when quiting multiple cursor selection
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
        exe 'NeoCompleteUnlock'
    endif
endfunction

"==================================================
" vim-indent-guides
"==================================================
let g:indent_guides_enable_on_vim_startup=1
set ts=4 sw=4 et
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1




" Let vim use the system clipboard
set clipboard=unnamed

" Always show powerline
set laststatus=2

" Set color mode to 256 
set t_co=256

