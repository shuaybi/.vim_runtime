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

"colorscheme
set background=dark
colorscheme gruvbox
let g:gruvbox_italicize_comments=0
let g:gruvbox_italic=0

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 236
"colo seoul256

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
