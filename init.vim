" Enable syntax highlighting
syntax on

" Enable spellcheck
set spell

highlight clear SpellBad
highlight SpellBad term=underline cterm=underline gui=underline

" Show line numbers
set number

" Set the text width to 80 characters
set textwidth=80

" Enable automatic word wrapping
set wrap

" Wrap at word boundaries rather than exactly at the textwidth
set linebreak

" Show a vertical line at the textwidth column
" set colorcolumn=+1

" Auto indent
set autoindent
set smartindent

" Highlight search matches and incremental search
set hlsearch
set incsearch

" Case insensitive search
set ignorecase
set smartcase

" Map H to jump to the first non-blank character of the line
nnoremap H ^

" Map L to jump to the end of the line
nnoremap L $

" Show underline on line with cursor
set cursorline

" Quickly toggle cursor line
nnoremap <leader>cl :set cursorline!<CR>

" Quickly toggle cursor column
nnoremap <leader>cc :set cursorcolumn!<CR>

" Line Movement Mappings
" These mappings allow you to move lines up and down in different Vim modes
" using Ctrl-J and Ctrl-K.

" Normal mode: Move current line up or down
" <C-j> moves the current line down
" <C-k> moves the current line up
nnoremap <silent> <C-j> :move .+1<CR>==
nnoremap <silent> <C-k> :move .-2<CR>==

" Insert mode: Move current line up or down
" These mappings briefly switch to normal mode, move the line, and return to insert mode
inoremap <silent> <C-j> <Esc>:move .+1<CR>==gi
inoremap <silent> <C-k> <Esc>:move .-2<CR>==gi

" Visual mode: Move selected lines up or down
" These mappings move the entire selected block of text
vnoremap <silent> <C-j> :move '>+1<CR>gv=gv
vnoremap <silent> <C-k> :move '<-2<CR>gv=gv

" Remap 'jj' to escape (don't put any comments after following line)
inoremap jj <Esc>
