syntax on

set number

set ruler " Display the current line number in the status bar

set autoindent " New lines will keep the previous indentation

filetype indent on " Enable file type based indentation

filetype plugin on " Enable file type based plugins

set ignorecase " When searching (/) will ignore the case of the input

set smartcase " Don't ignore case when the term contains any uppercase

set paste " To ignore auto-indent when pasting from the clipboard

set hlsearch " Highlight search results. To clear use :noh

set incsearch " Search incrementally, as you type

map <c-w> :tabclose<cr> " CTRL+W will close the current tab

map <c-t> :tabnew<cr> " CTRL+T opens a new tab

nnoremap <leader>s :w<cr> " \s will save the current file

map <tab> :tabNext<cr> " Jump to next tab

nnoremap <c-n> :set invrelativenumber<cr> " relative line #s

set backspace=indent,eol,start " fix BS, del

nnoremap <s-tab> :tabprevious<cr> " Jump to previous tab

set laststatus=2 " Always display status line
set statusline+=%F

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set smarttab        " make "tab" insert indents instead of tabs at the beginning of a line

set expandtab       " Expand TABs to spaces

set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs


" Strip trailing spaces throughout an entire file on save

autocmd BufWritePre *.py,*.js,*.html,*.css,*.md :call <SID>StripTrailingWhitespaces()

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

set dictionary=/usr/share/dict/words
