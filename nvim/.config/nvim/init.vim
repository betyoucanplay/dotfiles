set nocompatible
set hidden

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" specify a directory for plugins
call plug#begin('~/.config/nvim/bundle')

" Common
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lilydjwg/colorizer'
Plug 'mbbill/undotree'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-peekaboo'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Code
Plug 'moll/vim-node'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'plasticboy/vim-markdown'

" Style:
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set completeopt=longest,menuone,preview
set t_Co=256
set pumheight=15
set autoindent
set history=10000
set updatetime=100
let mapleader = "´"
"set guicursor=a:blinkon100

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:blinkon100
augroup END

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall


set wildmenu
set wildmode=longest:full,full

" Splits
set splitbelow
set splitright
set fillchars+=vert:\▎

set laststatus=2
set noshowmode
set showcmd

set sessionoptions+=tabpages,globals

" Fast switching to normal mode
set timeoutlen=1000 ttimeoutlen=0

" No automatic comment signs
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line Numbers
set number
set cursorline

" Disable code folding
set nofoldenable

" Undofile
set undofile
set undodir=~/.config/nvim/undodir
set undolevels=5000
set noswapfile

" Detect file changes
set autoread

set encoding=utf-8
set fileformat=unix

" Show the matching part of the pair for [] {} and ()
set showmatch

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Keep cursor 10 lines away from top/Bottom
set scrolloff=10

" Use mouse
set mouse=a

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" make uses real tabs
au FileType make set noexpandtab

" Search
set ignorecase
set smartcase
set incsearch
set nohlsearch

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Terminal
au TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * startinsert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Follow links in help
nnoremap ü <C-]>
nnoremap Ü <C-O>

" Habit breaking
nnoremap <Left>      :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right>      :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
"inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up>      :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
"inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down>      :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
"inoremap <Down> <C-o>:echo "No down for you!"<CR>

" Paste mode
set pastetoggle=<F2>

" Clear highlighted searches
nnoremap <Leader><space> :noh<cr>

" Open Terminal
nnoremap <silent> <Leader>s :15split term://zsh<CR>

" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Map window switching
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <Leader>+ :exe "resize +20"<CR>
nnoremap <silent> <Leader>- :exe "resize -20" <CR>
nnoremap <silent> <Leader>> :exe "vertical resize +20"<CR>
nnoremap <silent> <Leader>< :exe "vertical resize -20"<CR>

" Toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" Toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" Go to next buffer
nnoremap <silent> <leader>bn :bn<CR>

" Go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" Kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" New buffer
nnoremap <silent> <Leader>be :enew<CR>

" Horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" Vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" whitespace
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" Make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" For vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_operators = 1
let g:python_highlight_file_headers_as_comments = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" vimtex
""""""""""
let g:tex_flavor = 'latex'

""""""""""
" NERDTree
""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""
" Vimwiki
""""""""""
let g:vimwiki_list = [{'path': '~/docs/wiki/','path_html': '~/docs/wiki/html/'}]
" Vimwiki: Fix markdown autodetection
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_text_ignore_newline = 0

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Startyfy
let g:startify_fortune_use_unicode = 1

""""""""""""""""""""""
" coc
""""""""""""""""""""""

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Don't show signcolumn
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
let g:UltiSnipsExpandTrigger = "<nop>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""
" FZF
"""""""""""""
map <Leader>t :FZF <cr>
map <Leader>h :History <cr>
map <Leader>c :History: <cr>
map <Leader>b :Buffers <cr>
map <Leader>l :Lines <cr>
map <Leader>m :Maps <cr>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --smart-case --glob "!.git"'
let g:fzf_layout = { 'down': '~20%' }

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_command_prefix = 'FZF'


"""""""
" Goyo
"""""""
let g:goyo_width="85%"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gui/no gui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=RobotoMono\ Nerd\ Font\ Medium\ 11

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme roxsource
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! ActiveStatusLine()
    let l:statusline=""
    let l:statusline.=SetModeActiveStatusLine(mode())
    let l:statusline.="%#StatusLineModePM#"
    let l:statusline.="%{&paste?'\ PASTE\ ':''}"
    let l:statusline.="%{&spell?'\ SPELL\ ':''}"
    let l:statusline.="%#StatusLineBuffer#"
    let l:statusline.=" Σ%{GetSumBuffers()}/%n\ "
    let l:statusline.="%#StatusLineGit#"
    let l:statusline.="%{GetBranchFugitive()}"
    let l:statusline.="%<"
    let l:statusline.="%#StatusLineActive#"
    let l:statusline.="\ %F\ "
    let l:statusline.="%r%m"
    let l:statusline.="%="
    let l:statusline.="%#StatusLineFileAttr#"
    let l:statusline.="\ %{strlen(&ft)?&ft:'none'}\ \|\ "
    let l:statusline.="%{strlen(&fenc)?&fenc:&enc}\ \|"
    let l:statusline.="%{GetFileformat()}\ "
    let l:statusline.="%#StatusLineLine#"
    let l:statusline.="\ \ %4l/%L:%2c\ "
    let l:statusline.="%#StatusLinePercent#"
    let l:statusline.="\ %3p%%\ "
    return l:statusline
endfun

fun! InactiveStatusLine()
    let l:statusline=""
    let l:statusline.=SetModeInactiveStatusLine(mode())
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="%{&paste?'\ PASTE\ ':''}"
    let l:statusline.="%{&spell?'\ SPELL\ ':''}"
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="\ Σ%{GetSumBuffers()}/%n\ "
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="%{GetBranchFugitive()}"
    let l:statusline.="%<"
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="\ %F\ "
    let l:statusline.="%r%m"
    let l:statusline.="%="
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="\ %{strlen(&ft)?&ft:'none'}\ \|\ "
    let l:statusline.="%{strlen(&fenc)?&fenc:&enc}\ \|"
    let l:statusline.="%{GetFileformat()}\ "
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="\ \ %4l/%L:%2c\ "
    let l:statusline.="%#StatusLineInactive#"
    let l:statusline.="\ %3p%%\ "
    return l:statusline
endfun!

set statusline=%!ActiveStatusLine()

augroup setStatuslineStatus
    autocmd!
    autocmd WinEnter * setlocal statusline=%!ActiveStatusLine()
    autocmd WinLeave * setlocal statusline=%!InactiveStatusLine()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color and label for vim mode in active statusline
fun SetModeActiveStatusLine(mode)
    let l:modes={
                \ 'n'       :   "%#StatusLineModeNormal#\u00A0NORMAL\u00A0",
                \ 'i'       :   "%#StatusLineModeInsert#\u00A0INSERT\u00A0",
                \ 'R'       :   "%#StatusLineModeReplace#\u00A0REPLACE\u00A0",
                \ 'c'       :   "%#StatusLineModeCommand#\u00A0COMMAND\u00A0",
                \ 't'       :   "%#StatusLineModeTerminal#\u00A0TERMINAL\u00A0",
                \ '!'       :   "%#StatusLineModeTerminal#\u00A0SHELL\u00A0",
                \ 'v'       :   "%#StatusLineModeVisual#\u00A0VISUAL\u00A0",
                \ 'V'       :   "%#StatusLineModeVisual#\u00A0V-LINE\u00A0",
                \  "\<C-v>" :   "%#StatusLineModeVisual#\u00A0V-BLOCK\u00A0",
                \ 's'       :   "%#StatusLineModeSelect#\u00A0SELECT\u00A0",
                \ 'S'       :   "%#StatusLineModeSelect#\u00A0S-LINE\u00A0",
                \ "\<C-s>"  :   "%#StatusLineModeSelect#\u00A0S-BLOCK\u00A0",
                \}
    return l:modes[a:mode]
endfun

" Set color and label for vim mode in inactive statusline
fun SetModeInactiveStatusLine(mode)
    let l:modes={
                \ 'n'       :   "%#StatusLineInactive#\u00A0NORMAL\u00A0",
                \ 'i'       :   "%#StatusLineInactive#\u00A0INSERT\u00A0",
                \ 'R'       :   "%#StatusLineInactive#\u00A0REPLACE\u00A0",
                \ 'c'       :   "%#StatusLineInactive#\u00A0COMMAND\u00A0",
                \ 't'       :   "%#StatusLineInactive#\u00A0TERMINAL\u00A0",
                \ '!'       :   "%#StatusLineInactive#\u00A0SHELL\u00A0",
                \ 'v'       :   "%#StatusLineInactive#\u00A0VISUAL\u00A0",
                \ 'V'       :   "%#StatusLineInactive#\u00A0V-LINE\u00A0",
                \  "\<C-v>" :   "%#StatusLineInactive#\u00A0V-BLOCK\u00A0",
                \ 's'       :   "%#StatusLineInactive#\u00A0SELECT\u00A0",
                \ 'S'       :   "%#StatusLineInactive#\u00A0S-LINE\u00A0",
                \ "\<C-s>"  :   "%#StatusLineInactive#\u00A0S-BLOCK\u00A0",
                \}
    return l:modes[a:mode]
endfun

" Get fileformat devicon
fun! GetFileformat()
    return winwidth(0) > 70 ? ' ' . (WebDevIconsGetFileFormatSymbol()) . ' ' : ''
endfun

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Get git branch
fun! GetBranchFugitive()
    if exists('g:loaded_fugitive')
        let l:head = fugitive#head()
        let l:symbol = "\u00A0\ue0a0\u00A0"  " different symbol ->⎇
        return empty(l:head) ? "" : l:symbol.l:head . "\u00A0"
    endif
    return '':
endfun

" Get number of buffers
fun! GetSumBuffers()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfun
