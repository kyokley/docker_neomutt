" F2 toggles line numbers
" F3 toggles file browser
" F4 toggles object browser
" F5 toggles undo tree
" F10 toggles paste mode
" <leader>h clears highlighting and signify symbols
"
" jj <Esc>
" JJ <Esc>
" kk <Esc>
" KK <Esc>
"
" Shift-L :bnext
" Shift-H :bprev
" Shift-J 20 lines down
" Shift-K 20 lines up
"
" Ctrl-j Move down a window
" Ctrl-k Move up a window
" Ctrl-h Move left a window
" Ctrl-l Move right a window
"
" <Tab> Jump to next word
" Shift-<Tab> Jump back a word
"
let $MYVIMRC = $HOME."/.nvim/init.vim"

filetype off
call plug#begin('~/.nvim/plugged')
Plug 'tommcdo/vim-exchange'
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'

call plug#end()
filetype plugin indent on

syntax on

" General settings
set number
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set hidden
set noautowrite
set nosmartindent
set smarttab
set showmatch
set scrolloff=5
set visualbell
set autochdir
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*.git
set nowrapscan
set textwidth=0
set mouse=""

highlight MatchParen ctermbg=4

set cul

colo CandyPaper
hi CursorLine cterm=NONE ctermbg=18 ctermfg=white guibg=darkblue guifg=white
hi colorcolumn cterm=NONE ctermbg=black guibg=black
hi LineNr cterm=NONE ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
hi search cterm=NONE ctermbg=lightblue ctermfg=black guibg=lightblue guifg=black
hi signcolumn cterm=NONE ctermbg=black guibg=black
hi Pmenu cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkgreen guifg=white
hi PmenuSel cterm=NONE ctermbg=white ctermfg=black guibg=white guifg=black
hi visual cterm=NONE ctermbg=white ctermfg=black guibg=white guifg=black
hi statusline cterm=NONE ctermbg=4 ctermfg=white
hi statuslinenc cterm=NONE ctermbg=black ctermfg=white

hi TermCursorNC ctermbg=1 ctermfg=15

nnoremap <Leader>c :set cursorline!<CR>

hi SpellBad cterm=NONE ctermbg=darkred ctermfg=yellow guibg=darkred guifg=yellow

set incsearch
set hlsearch

set timeout
set timeoutlen=400
set ttimeoutlen=100

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F5> :MundoToggle<CR>
nnoremap <F6> :set nolist!<CR>
nnoremap <silent> <leader>h :noh<CR>:silent! call flake8#Flake8UnplaceMarkers()<CR>:sign unplace *<CR>
nnoremap <silent> <leader>g :redir @g<CR>:g//<CR>:redir END<CR>:new<CR>:put! g<CR>

inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap jj <Esc>
inoremap kk <Esc>
inoremap JJ <Esc>
inoremap KK <Esc>

" A little macro to remove special aligning
let @u = ':silent! s/\(\S\)\s\{2,\}/\1 /g:silent! s/\S\zs\s\+\ze[:\])]//g'
noremap <leader>u :norm @u<CR>

noremap <leader>s :norm @i<CR><CR>

"Allow command to accept a count
noremap <silent> <S-j> @='20j'<CR>
noremap <silent> <S-k> @='20k'<CR>

nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprev<CR>
vnoremap <S-l> 5l
vnoremap <S-h> 5h
noremap <S-y> y$
noremap <S-Up> :tabp<CR>
noremap <S-Down> :tabn<CR>
noremap <S-Left> :bprev<CR>
noremap <S-Right> :bnext<CR>

" Handle terminal windows
autocmd TermOpen,BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l
noremap <C-Left> <C-w>h
nnoremap <Tab> w
vnoremap <Tab> w
nnoremap <S-Tab> b
vnoremap <S-Tab> b
nnoremap <leader>a <Esc>:LAck!
nnoremap <C>a <Esc>:LAck!
noremap <leader>fc /\v^[<=>]{7}( .*\|$)<CR>

nnoremap ,v :source $MYVIMRC<CR>
nnoremap ,e :e $MYVIMRC<CR>

" Signify Settings
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=Green
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=Red
highlight DiffChange        cterm=bold ctermbg=none ctermfg=Yellow
highlight DiffText        cterm=bold ctermbg=Red ctermfg=Yellow


"NVim configs
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set inccommand=split
set guicursor=

"statusline setup
set statusline=
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator

set statusline+=%#warningmsg#
set statusline+=%*
"
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}\ " Space at the end of the line left intentionally
set statusline+=%{StatuslineLongLineWarning()}\ " Space at the end of the line left intentionally

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2


" AutoCommands!
augroup EditVim
    autocmd!
    au InsertEnter * if &buftype != 'nofile' | hi LineNr ctermbg=darkred   guibg=darkred | endif
    au InsertEnter * if &buftype != 'nofile' | hi CursorLine ctermbg=darkred guibg=darkred | else | hi CursorLine ctermbg=NONE guibg=NONE | endif
    au InsertLeave * if &buftype != 'nofile' | hi LineNr ctermbg=NONE guibg=NONE | endif
    au InsertLeave * hi CursorLine ctermbg=18 guibg=darkblue

    au FileType svn,*commit* setlocal spell
    au FileType git,*commit* setlocal spell
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    au VimEnter * set title
    au BufEnter * let &titlestring = "nvim " . expand("%:p")
    "recalculate the trailing whitespace warning when idle, and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
    autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
augroup END

augroup filetype_python
    autocmd!
    au FileType python set foldmethod=indent
    au FileType python set foldlevel=99
    au FileType python set omnifunc=pythoncomplete#Complete
    "au FileType python set nosmartindent
    "au FileType python BracelessEnable +indent +highlight-cc2
    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    au FileType python set listchars=trail:_
    au FileType python set list

    " Also highlight all tabs and trailing whitespace characters.
    au FileType python highlight ExtraWhitespace ctermbg=darkred guibg=darkred ctermfg=yellow guifg=yellow
    au FileType python match ExtraWhitespace /\s\+$\|\t/
    let python_highlight_all = 1
    "au FileType python colo molokai
augroup END

augroup filetype_htmldjango
    autocmd!
    au FileType htmldjango set foldmethod=indent
    au FileType htmldjango set foldlevel=99
augroup END

augroup filetype_cs
    autocmd!
    au FileType cs set omnifunc=syntaxcomplete#Complete
    au FileType cs set foldmethod=marker
    au FileType cs set foldmarker={,}
    au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
    au FileType cs set foldlevelstart=2
    au FileType cs set smartindent
augroup END

augroup filetype_text
    autocmd!
    au FileType text setlocal smartindent
    au FileType text setlocal spell spelllang=en_us
    au FileType text setlocal noexpandtab
augroup END

augroup filetype_md
    autocmd!
    au FileType markdown setlocal smartindent
    au FileType markdown setlocal spell spelllang=en_us
    au FileType markdown setlocal noexpandtab
augroup END

augroup filetype_help
    autocmd!
    au FileType help setlocal nospell
augroup END

augroup filetype_term
    autocmd!
    au TermOpen * setlocal nonumber
augroup END

" TODO: Consolidate settings for filetypes in the edit augroup
augroup filetype_git
    autocmd!
    au FileType git setlocal nospell
augroup END

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

set nobackup

if version >= 703
    set undofile
    set undolevels=1000
    set undoreload=1000
    if !has('nvim')
        set cm=blowfish
    endif
endif

function! InitializeDirectories()
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
              \ 'backup': 'backupdir',
              \ 'views': 'viewdir',
              \ 'swap': 'directory',
              \ 'undodir': 'undodir' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "//"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else
          if version < 703
              if settingname == 'undodir'
                  continue
              endif
          endif
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories()
