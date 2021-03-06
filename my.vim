"" space between lines
set linespace=6

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

" add dash character to search 
" (searches for whole words separated by dash characters)
set isk+=-

" don't show tabline on top (as I don't use tabs)
set showtabline=0
set hidden

" rational: https://stackoverflow.com/questions/1269648/how-do-i-close-a-single-buffer-out-of-many-in-vim
set wildmode=list:longest,full

" do not ever wrap lines
set tw=999999
set wrap

" modelines
set modeline
set modelines=5

 if has("gui_running")
  set macligatures
endif
"set gfn=Consolas:h16,Fira\ Mono:h15,Inconsolata:h16,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
"set gfn=Inconsolata:h17,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
set guifont=Fira\ Code:h15
"set guifont=Inconsolata:h17

"colorscheme
"set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_italicize_comments=0
let g:gruvbox_italic=0

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-i-c-a:hor30-iCursor-blinkwait300-blinkon200-blinkoff150
"set guicursor=n-v-c:block-Cursor-blinkon100
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor-blinkwait175-blinkoff150-blinkon175
"set guicursor+=i-ci:ver20-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

let g:online_thesaurus_map_keys = 0
nnoremap <leader>t :OnlineThesaurusCurrentWord<CR>:set wrap<CR>
" show line numbers
set number
"set relativenumber

" for long wrapped lines, prevent jumps in the screen
set display=lastline

" error highlight lines that go over 99 characters
"match ErrorMsg '\%>99v.\+'

" disable persistent undo (where undo info is retained across vim sessions)
set noundofile

" disable folding
set nofoldenable
" autocmd FileType * exe "normal zR"

" press ENTER to create new line after the current line
" nmap <CR> o<Esc>

" don't insert comment char on new line (when creating multi-line comment)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


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
nnoremap ] :bnext<cr>
nnoremap [ :bprev<cr>
nnoremap <leader>z :bw<cr>

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

" clear search highlights on esc
map <esc> :noh<cr>

" cycle through windows using tt
nnoremap tt :wincmd w<cr>

nnoremap ss :wa<cr>
" below settings require the vim-auto-save plugin:
" https://github.com/907th/vim-auto-save
"let g:auto_save_events = ["InsertLeave", "TextChanged"]
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
"set updatetime=1000

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
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"nnoremap <Leader>f :NERDTreeToggle<Enter>
"nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"let NERDTreeQuitOnOpen = 0

" close vim if the only window left open is a NERDTree?
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" automatically delete the buffer of the file you just deleted with NerdTree:
"let NERDTreeAutoDeleteBuffer = 1

"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

" show hidden files (starting with dot)
"let NERDTreeShowHidden=1
"let NERDTreeIgnore = ['\.DS_Store$']

"let g:fzf_layout = { 'window': 'let g:launching_fzf = 1 | keepalt topleft 100split enew' }

"autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
"autocmd BufWinEnter * call PreventBuffersInNERDTree()

"function! PreventBuffersInNERDTree()
"  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
"    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
"    \ && &buftype == '' && !exists('g:launching_fzf')
"    let bufnum = bufnr('%')
"    close
"    exe 'b ' . bufnum
"  endif
"  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
"endfunction
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
" Set this to 1 to set searching by filename (as opposed to full path)
" let g:ctrlp_by_filename = 1
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
"nnoremap <Leader>j :CtrlP<CR>
nnoremap ; :CtrlP<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<tab>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<s-tab>']
  \ }


" let g:ctrlp_cmd='CtrlP :pwd'

" Enter shows CtrlP buffer
" nmap <CR> :CtrlPBuffer<CR>
" - shows CtrlP buffer
nnoremap \ :CtrlPBuffer<CR>
nnoremap mm :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<cr>

" Easy bindings for its various modes
" nnoremap <leader>px :CtrlPMixed<cr>
" nnoremap <leader>pm :CtrlPMRU<cr>


let g:ctp_max_height = 50
" following is ignored if we use external search program such as ag
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|_build\|deps\'

" window on top, order ttb (top to bottom - most recent on top)
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

" fuzzy search in projects folder
" noremap <C-p> :CtrlP ~/projects/<CR>

let g:ctrlp_mruf_last_entered = 1

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', ';', '<2-LeftMouse>'],
    \ 'PrtSelectMove("j")':   ['<space>', '<c-j>', '<down>', '<tab>'],
    \ 'PrtSelectMove("k")':   ['<s-space>', '<c-k>', '<up>', '<s-tab>']
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dbext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Each profile has the form:
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
let g:dbext_default_profile = 'psql'
let g:dbext_default_profile_uat_io_audit='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=in2_io_uat:user=io_audit'
let g:dbext_default_profile_uat_in2_io='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=in2_io_uat:user=in2_admin'
let g:dbext_default_profile_uat_io_checklist='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=io_checklist:user=in2_admin'
let g:dbext_default_profile_prd_io_checklist='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=io_checklist:user=in2_admin'
let g:dbext_default_profile_uat_io_chat='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=io_chat:user=in2_admin'
let g:dbext_default_profile_uat_audit='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=io_audit_uat:user=in2_admin'
let g:dbext_default_profile_prd_io='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=in2_io:user=in2_admin'
let g:dbext_default_profile_prd_in2_bot='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=in2_bot:user=in2_admin'
let g:dbext_default_profile_uat_in2_bot='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=in2_bot_uat:user=in2_admin'
let g:dbext_default_profile_prd_io_audit='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=in2_io:user=io_audit'
let g:dbext_default_profile_prd_audit='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=io_audit:user=in2_admin'
let g:dbext_default_profile_dev_io='type=PGSQL:host=localhost:port=5432:dbname=in2_io_dev:user=in2_admin'
let g:dbext_default_profile_fs='type=ORA:srvname=faq_store_prd:user=rfpdb_user:passwd=rfpdb_user' 
let g:dbext_default_profile_uat_histex='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=histex_uat:user=in2_admin'
let g:dbext_default_profile_prd_histex='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=histex:user=in2_admin'
let g:dbext_default_profile_uat_tradex='type=PGSQL:host=vmlinpgsqluat1:port=5432:dbname=tradex_uat:user=in2_admin'
let g:dbext_default_profile_prd_tradex='type=PGSQL:host=vmlinpgsqlprd1:port=5432:dbname=tradex:user=in2_admin'
" autocmd VimEnter * DBCompleteTables
" DBCheckModeline
" DBPromptForBufferParameters (or ,sbp)
" Useful commands: 
" ,sdt - describe table
" ,slt - list tables in database
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"map s <Plug>(easymotion-overwin-f2)

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
" Turn on case insensitive feature
"map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

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

"augroup filetypedetect
"    au BufRead,BufNewFile *.drab set filetype=eelixir
"augroup END

"don't hide double quotes in json files
set conceallevel=0

"highlight sql files using pgsql plugin
let g:sql_type_default = 'pgsql'

let g:syntastic_javascript_checkers=['eslint']

""""""" pangloss/vim-javascript """""""
let g:javascript_plugin_jsdoc = 1

""""""" othree/javascript-libraries-syntax.vim """""""
let g:used_javascript_libs = 'underscore,jquery,react'

let g:closetag_filenames = '*.html,*.jsx,*.js'

""""""" Valloric/MatchTagAlways """""""
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1,
\}

" Used for mhinz/vim-grepper
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

""""""" mxw/vim-jsx """""""
" file does not have to have jsx extension
let g:jsx_ext_required = 0

" Plug javascript-libraries-syntax.vim
let g:used_javascript_libs = 'lodash,react,jQuery,'

" Goyo (distraction free editing)
let g:goyo_width = 101
function! s:goyo_enter()
  set list
  " unicode chars: type ctrl-vu followed by 4 digit hex code
  " ¬	U+00AC	not sign
  " ▸	U+25B8	black right-pointing small triangle
  set listchars=tab:▸\ ,eol:¬,trail:_,extends:>,precedes:<,nbsp:_,space:·
endfunction

"toggle distraction free mode
""nnoremap <Leader>z :LiteDFMToggle<CR>

"set statusline=%{expand('%:p:h:t')}/%t

"""""" lightline """"""""""
" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }
"show file name and parent directory
function! FilenameForLightline()
  return expand('%:h:t') . '/' . expand('%:t')
endfunction
