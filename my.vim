set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Set 4 lines to the cursor - when moving vertically using j/k
set so=4

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""" my config """""""

"" space between lines
set linespace=5

" disable autoindent 
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" focus follows mouse
"set mousefocus

"auto change dir to that of current file
" disabled because there is a bug: buftype changes and no longer able to write the file
" set autochdir

" by default, the indent is 2 spaces. 
set shiftwidth=2
set softtabstop=2
set tabstop=2

" do not ever wrap lines
set tw=999999
set wrap

" modelines
set modeline
set modelines=5

"set gfn=Consolas:h16,Fira\ Mono:h15,Inconsolata:h16,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
set gfn=Inconsolata:h17,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15

let g:online_thesaurus_map_keys = 0
nnoremap <leader>t :OnlineThesaurusCurrentWord<CR>:set wrap<CR>

" colorscheme
set background=dark
colorscheme gruvbox
let g:gruvbox_italicize_comments=0
let g:gruvbox_italic=0

" show line numbers
set number

" for long wrapped lines, prevent jumps in the screen
set display=lastline

" error highlight lines that go over 99 characters
"match ErrorMsg '\%>99v.\+'

" disable persistent undo (where undo info is retained across vim sessions)
set noundofile

" disable folding
set nofoldenable
autocmd FileType * exe "normal zR"

" press ENTER to create new line after the current line
" nmap <CR> o<Esc>

" don't insert comment char on new line (when creating multi-line comment)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set guicursor=n-ci:hor30-iCursor-blinkwait300-blinkon200-blinkoff150

" for ahlulbayt blog
nmap <leader>y i<space><esc>lysiw)
"""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
" """"""""""""""""""""""""""""""""""""""""""""""""
"open file in same window
"let g:netrw_browse_split=0
" let g:netrw_liststyle=3
" no banner
" let g:netrw_banner=0
" open file in vertical split
" let g:netrw_altv=1
" let g:netrw_preview=1
" """""""""""""""""""""""""""""""""""""""""""""""""

" use tab and shift-tab to switch quickly between next/prev buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" my important bindings
" nnoremap <leader>x :Explore<cr>
" netrw - open dir listing on left hand side and open files to the right (with a)
" nnoremap - :Lexplore<cr>
nnoremap - :Explore<cr>
nnoremap = :MRU<cr>
" show/hide invisible chars
"nnoremap <leader>l :set list!<cr>
set list
" unicode chars: type ctrl-vu followed by 4 digit hex code
" ¬	U+00AC	not sign
" ▸	U+25B8	black right-pointing small triangle
set listchars=tab:▸\ ,eol:¬,trail:_,extends:>,precedes:<,nbsp:_,space:·

" fast saving
"nnoremap <leader>s :w!<cr>

" redefine esc key
" inoremap <esc> <nop>
inoremap jk <esc>
" inoremap kj <esc>

" cycle through windows using tt
nnoremap tt :wincmd w<cr>

" below settings require the vim-auto-save plugin:
" https://github.com/907th/vim-auto-save
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
set updatetime=1000

" start in full screen mode
" set fu
" :set nofu "for non full screen mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch plugin: https://github.com/haya14busa/incsearch.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :h g:incsearch#auto_nohlsearch
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
let g:incsearch#auto_nohlsearch = 1
nmap n  <Plug>(incsearch-nohl-n)
nmap N  <Plug>(incsearch-nohl-N)
nmap *  <Plug>(incsearch-nohl-*)
nmap #  <Plug>(incsearch-nohl-#)
nmap g* <Plug>(incsearch-nohl-g*)
nmap g# <Plug>(incsearch-nohl-g#)
" ctrl-l redraw screen and remove search highlights
nnoremap <silent> <C-l> :nohl<CR><C-l>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set notimeout nottimeout
set ttimeout
set ttimeoutlen=1500

" F5 => show buffers
" :nnoremap <F5> :buffers<CR>:buffer<Space>
" task_uuid = extract_uuid(payload)
" case 

" MRU plugin settings (https://github.com/vim-scripts/mru.vim)
let MRU_Max_Entries = 100
"let MRU_Window_Height = 20
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Use_Current_Window = 1
let MRU_Add_Menu = 0
let MRU_Auto_Close = 1

" enable rainbow parenthesis
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" :tabedit % will open the current buffer in a new tab
" :tabclose when finished and return to your finely tuned set of splits.
" maintain the cursor position in the new tab:
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap t% :call OpenCurrentAsNewTab()<CR>
nmap td :tabclose<CR>

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

" automatically leave insert mode after <N>ms of inaction
"au CursorHoldI * stopinsert
"au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
"au InsertLeave * let &updatetime=updaterestore
" matchit for elixir
"autocmd FileType elixir let b:match_words = '\<\%(case\|cond\|if\|unless\|try\|loop\|receive\|fn\|' .
 "     \ 'defmodule\|defimpl\|defmacro\|defdelegate\|defexception\|defcallback\|defoverridable\|defp\|def\|test\)\>=\@!:' .
 "     \ '\<\%(else\|elsif\|catch\|after\|rescue\)\>:' .
 "     \ '\<end\>,{:},\[:\],(:)'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" confirm quit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ConfirmQuit(writeFile)
    if (a:writeFile)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        :write
    endif

    if (winnr('$')==1 && tabpagenr('$')==1)
        if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
            :quit
        endif
    else
        :quit
    endif
endfu

" disable for now
"cnoremap <silent> q<CR>  :call ConfirmQuit(0)<CR>
"cnoremap <silent> x<CR>  :call ConfirmQuit(1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open node (either file or dir) with single click
" let NERDTreeMouseMode=3

" open NERDTree automatically when vim starts up
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" automatically delete the buffer of the file you just deleted with NerdTree:
" let NERDTreeAutoDeleteBuffer = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SOURCE: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader to Space
"let mapleader = "\<Space>"

" copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" cut/copy to clipboard
map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"nnoremap <Leader>j :CtrlP<CR>
nnoremap ] :CtrlP<CR>

" let g:ctrlp_cmd='CtrlP :pwd'

" Enter shows CtrlP buffer
" nmap <CR> :CtrlPBuffer<CR>
" - shows CtrlP buffer
nnoremap \ :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<cr>

" Easy bindings for its various modes
" nnoremap <leader>px :CtrlPMixed<cr>
" nnoremap <leader>pm :CtrlPMRU<cr>

let g:EasyMotion_do_mapping = 1

let g:ctp_max_height = 50
" following is ignored if we use external search program such as ag
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|_build\|deps\'

" window on top, order ttb (top to bottom - most recent on top)
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

" fuzzy search in projects folder
" noremap <C-p> :CtrlP ~/projects/<CR>

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

"""""""""""""""""""""""""""""""""""""""""
" Create a submode to handle windows
"""""""""""""""""""""""""""""""""""""""""
" enter submode whith <Leader>k and exit with <Leader>
call submode#enter_with('WindowsMode', 'n', '', '<Leader>k', ':echo "windows mode"<CR>')
call submode#leave_with('WindowsMode', 'n', '', '<Leader>')

" change of windows with hjkl
call submode#map('WindowsMode', 'n', '', 'j', '<C-w>j')
call submode#map('WindowsMode', 'n', '', 'k', '<C-w>k')
call submode#map('WindowsMode', 'n', '', 'h', '<C-w>h')
call submode#map('WindowsMode', 'n', '', 'l', '<C-w>l')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dbext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Each profile has the form:
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
"let g:dbext_default_profile = 'psql'
let g:dbext_default_profile_uat_io_audit='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=in2_io_uat:user=io_audit'
let g:dbext_default_profile_uat_io='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=in2_io_uat:user=in2_admin'
let g:dbext_default_profile_uat_audit='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=io_audit_uat:user=in2_admin'
let g:dbext_default_profile_prd_io='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=in2_io:user=in2_admin'
let g:dbext_default_profile_prd_io_audit='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=in2_io:user=io_audit'
let g:dbext_default_profile_prd_audit='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=io_audit:user=in2_admin'
let g:dbext_default_profile_dev_io='type=PGSQL:host=localhost:port=5432:dbname=in2_io_dev:user=in2_admin'
let g:dbext_default_profile_fs='type=ORA:srvname=faq_store_prd:user=rfpdb_user:passwd=rfpdb_user' 
" autocmd VimEnter * DBCompleteTables
" DBCheckModeline
" DBPromptForBufferParameters (or ,sbp)
" Useful commands: 
" ,sdt - describe table
" ,slt - list tables in database
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on case insensitive feature
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

"<Leader>f{char}   | Find {char} to the right. See |f|.
"<Leader>F{char}   | Find {char} to the left. See |F|.
"<Leader>t{char}   | Till before the {char} to the right. See |t|.
"<Leader>T{char}   | Till after the {char} to the left. See |T|.
"<Leader>w         | Beginning of word forward. See |w|.
"<Leader>W         | Beginning of WORD forward. See |W|.
"<Leader>b         | Beginning of word backward. See |b|.
"<Leader>B         | Beginning of WORD backward. See |B|.
"<Leader>e         | End of word forward. See |e|.
"<Leader>E         | End of WORD forward. See |E|.
"<Leader>ge        | End of word backward. See |ge|.
"<Leader>gE        | End of WORD backward. See |gE|.
"<Leader>j         | Line downward. See |j|.
"<Leader>k         | Line upward. See |k|.
"<Leader>n         | Jump to latest "/" or "?" forward. See |n|.
"<Leader>N         | Jump to latest "/" or "?" backward. See |N|.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fugitive bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

augroup filetypedetect
    au BufRead,BufNewFile *.drab set filetype=html
augroup END
