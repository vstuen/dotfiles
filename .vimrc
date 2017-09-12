"""
""" Appearance
"""

" Colors
syntax enable
colorscheme badwolf

" Formatting
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " turn tabs into spaces

" File formatting
filetype indent on " load filetype-specific indent files

" Visuals
set number         " show line numbers
set relativenumber " show line numbers relative to current pos
set showcmd        " show command in bottom bar
set cursorline     " highlight current line
set wildmenu       " visual autocomplete for command menu
set showmatch      " highlicht matching braces etc..
set wrap lbr       " wrapping breaks on words

" Optimizations
set lazyredraw " redraw only when needed

" Interactions
set mouse=a " Enable mouse support

"""
""" Functionality
"""

" Searching
set incsearch " search as characters are entered
set hlsearch  " highlight matches

"""
""" vim-plug
"""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
call plug#end()


"""
""" Key bindings
"""

" Remap leader key
let mapleader = ","

" Remap basic movement keys
"nnoremap ø l
"nnoremap l k
"nnoremap k j
"noremap j h
"nnoremap h <nop>

" Remap end/begin keys
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
vnoremap B ^
vnoremap E $
vnoremap ^ <nop>
vnoremap $ <nop>

" Functionality
nnoremap <leader><space> :nohlsearch<CR> " clear search highlight
nnoremap <leader>l :call ToggleNumber()<CR>

" Remap for split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" 
""" EasyAlign plugin
""" 
" interactive in visual (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" interactive for motion/text (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""
""" Functions
"""

" ToggleNumber toggles between relative 
" and norelative line numbers
function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
        else
                set relativenumber
        endif
endfunc

