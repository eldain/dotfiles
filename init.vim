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

" Highlight yanked text for better visual feedback
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({timeout = 240})
augroup END

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

" Ensure default status line is dark with white text for the current window and dark gray for non-current windows
highlight StatusLine guifg=#ffffff guibg=#000000    " White text, black background for the active window
highlight StatusLineNC guifg=#808080 guibg=#000000  " Gray text, black background for non-active windows

" Define highlight groups for each mode with a dark background and a11y-friendly text colors
highlight StatusLineNormal guifg=#ffffff guibg=#000000 " White text for Normal mode
highlight StatusLineInsert guifg=#00ff00 guibg=#000000 " Bright green text for Insert mode
highlight StatusLineVisual guifg=#ffcc00 guibg=#000000 " Yellow text for Visual mode
highlight StatusLineReplace guifg=#ff0000 guibg=#000000 " Red text for Replace mode

" Function to set the highlights for status line, MsgArea, and ModeMsg
function! SetStatusAndCmdlineColor(fg, bg)
  execute 'highlight StatusLine guifg=' . a:fg . ' guibg=' . a:bg
  execute 'highlight MsgArea guifg=' . a:fg . ' guibg=' . a:bg
  execute 'highlight ModeMsg guifg=' . a:fg . ' guibg=' . a:bg
  redrawstatus
endfunction

" Ensure the status line and mode line change colors depending on the mode
augroup StatusLineModeColors
  autocmd!
  autocmd VimEnter * call SetStatusAndCmdlineColor('#ffffff', '#000000') " Normal mode colors on start
  autocmd ModeChanged *:[n] call SetStatusAndCmdlineColor('#ffffff', '#000000') " Normal mode
  autocmd ModeChanged *:[i] call SetStatusAndCmdlineColor('#00ff00', '#000000') " Insert mode
  autocmd ModeChanged *:[vV] call SetStatusAndCmdlineColor('#ffcc00', '#000000') " Visual mode
  autocmd ModeChanged *:[R] call SetStatusAndCmdlineColor('#ff0000', '#000000') " Replace mode
augroup END

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
