" Vi improved, gotta be first
set nocompatible
" enable filetype extension
filetype on
filetype plugin on
" filetype indent on " auto file type based indentation
syntax enable

" Settings
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set t_Co=256                    " use 256 colors in vim
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set clipboard=unnamedplus       " use 'global register for copy'
" speed up vim
" set ttyfast
" set ttyscroll=3                 " noop on linux ?
" set lazyredraw          	    " Wait to redraw "
set updatetime=250

" speed up syntax highlighting
" set nocursorcolumn
" set nocursorline

" syntax sync minlines=256
" set synmaxcol=300
" set re=1

" open help vertically
" command! -nargs=* -complete=help Help vertical belowright help <args>
" autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80 " was 79
set formatoptions=qrn1
set colorcolumn=81 " was 80
"set relativenumber
"set norelativenumber

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

set autoindent
set complete-=i
" set showmatch
set smarttab

" use tabs by default
set tabstop=4   " 4 spaces for a tab
set shiftwidth=4    " 4 spaces for identation
set expandtab   " insert space characters whenever tab is pressed
set softtabstop=4
set list listchars=tab:▸\ ,trail:·  " show tabs and trailing spaces

" Unrecogised extensions fix
au BufRead,BufNewFile *.rockspec set filetype=lua
au BufRead,BufNewFile *.md       set filetype=markdown

" Ask to clean all trailing white-spaces upon saving
autocmd BufWritePre * :%s/\s\+$//ec

" Use specific spacing for different formats
" expandtab, et:    <Tab> -> spaces
" tabstop, ts:      length of a <Tab>
" shiftwidth, sw:   spaces for autoindent
" softtabstop, sts: how many spaces a <Tab> inserts or <BS> removes
au FileType verilog,matlab setl et ts=4 sw=4 sts=4
au FileType lua setl et ts=3 sw=3 sts=2
au FileType c,cuda,tex,bib setl et ts=4 sw=2 sts=2
au FileType make set noexpandtab shiftwidth=8 softtabstop=0


set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone


let mapleader=","  " set map leader key to comma


" configure wildmenu tab completion
set wildmode=list:longest,full
set wildignorecase

" number of commands that are remembered
if &history < 1000
  set history=50
endif

" set maximum number of tabs
if &tabpagemax < 50
  set tabpagemax=50
endif

" create viminfo on exit to resume where you left off
if !empty(&viminfo)
  set viminfo^=!
endif

" number of lines visible above the cursor
if !&scrolloff
  set scrolloff=1
endif

" minimum number of screen columns to keep to the right and left of the cursor
if !&sidescrolloff
  set sidescrolloff=5
endif
" last line that doesn't fit on window will be displayed as much as possible
set display+=lastline

" gvim specific settings
set guioptions-=m "menu bar
set guioptions-=T "toolbar
set guioptions-=r "scrollbar
" Center the screen
nnoremap <space> zz

" python integration in neovim
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" to disable python support
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1

" persistent undo survives vim exits
if has("persistent_undo")
  set undodir=~/.vim/undodir/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

" use mouse if available
" if has('mouse')
  " set mouse=a
" endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" autocmd BufReadPost *
"  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Download vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

""" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'                           " git diff in the gutter
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'andschwa/vim-colors-solarized'                    " Best colors ever
Plug 'easymotion/vim-easymotion'                        " Movements
Plug 'christoomey/vim-tmux-navigator'			" tmux integration for easy pane movement
" Plug 'ctrlpvim/ctrlp.vim'                               " Fuzzy file .. finder
" Plug 'ervandew/supertab'
Plug 'EinfachToll/DidYouMean'                           " File guessing
" Plug 'elzr/vim-json'                                    " Better JSON
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}       " Go support for vim
Plug 'godlygeek/tabular'                                " natural alignment
Plug 'jceb/vim-orgmode'                                 " org mode for vim
Plug 'jiangmiao/auto-pairs'                             " auto close brackets
" Plug 'jistr/vim-nerdtree-tabs'                          "nerdtree and tabs sync
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                 " FZF
Plug 'junegunn/goyo.vim'                                "distraction free writing in vim
" Plug 'junegunn/vim-easy-align'                          " alignment like tabular
" Plug 'junegunn/limelight.vim'                           " highlight focused paragraph
" Plug 'ledger/vim-ledger'                                " Ledger
Plug 'majutsushi/tagbar'                                " Tagbar
Plug 'mbbill/undotree'
" , { 'on': 'UndotreeToggle' }      " Edits graph
Plug 'mhinz/vim-startify'                               "fancy startup for vim
" Plug 'nathanaelkane/vim-indent-guides'                  " visuals indents
Plug 'ntpeters/vim-better-whitespace'                   " Whitespace
" Plug 'plasticboy/vim-markdown'                          " Markdown vim mode
" Plug 'PProvost/vim-ps1'                                 " PowerShell
" Plug 'python-mode/python-mode'                          " ssss for python
" Plug 'Raimondi/delimitMate' "breaks Supertab            " brackets autocompleter
Plug 'scrooloose/nerdcommenter'				" commenter
Plug 'scrooloose/nerdtree'                              " Tree explorer for vim
Plug 'scrooloose/syntastic'                             " Syntax checker
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}                              " Asynchronous complter
" Plug 'Shougo/neosnippet.vim'                            " code snippets framework
" Plug 'Shougo/neosnippet-snippets'                       " code snippets repo
" Plug 'sjl/gundo.vim'                                    " visualize vim undo tree
" Plug 'sheerun/vim-polyglot'                             " language pack for vim
" Plug 'SirVer/ultisnips'                                 " snippet engine
" Plug 'honza/vim-snippets'                               " snippets
Plug 'terryma/vim-multiple-cursors'                     " multiple selections for vim
Plug 'tmux-plugins/vim-tmux'
" Plug 'tpope/vim-commentary'                             " Comments
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-eunuch'                                 " UNIX commands
Plug 'tpope/vim-fugitive'                               " Git interface
" Plug 'tpope/vim-repeat'                                 " Repeat for plugins
" Plug 'tpope/vim-rsi'                                    " Readline bindings
" Plug 'tpope/vim-scriptease'                             " VimL REPL
" Plug 'tpope/vim-sensible'                             " Sensible defaults
" builtin in neovim
" Plug 'tpope/vim-sleuth'                                 " Adaptive indentation
" Plug 'tpope/vim-speeddating'                            " use C-A/C-X to increment dates
" Plug 'tpope/vim-surround'                               " Surrounding
" Plug 'tpope/vim-unimpaired'                             " ][ mappings
" Plug 'tpope/vim-vinegar'                                " File explorer
Plug 'pangloss/vim-javascript'                          "improved javascript identation and syntax support
Plug 'vim-airline/vim-airline'                          " Status line
Plug 'vim-airline/vim-airline-themes'                   " Status line themes
Plug 'vim-scripts/a.vim'                                " easily switch .c -> .h and similar
Plug 'wlangstroth/vim-racket'                           " racket syntax support vim
" Plug 'vimwiki/vimwiki'                                  " Vimwiki
" Plug 'Yggdroot/indentLine'                              " display identation levels with thin vertical lines
Plug 'lervag/vimtex'                                  " Vim latex
call plug#end()

""" Plugin configurations
" appearance
set background=dark
silent! colorscheme solarized

" if running gui use different background like emacs
if has('gui_running')
  set background=light
else
  set background=dark
endif

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1  " always gitgutter even if nohl

" use powerline patched font
let g:airline_powerline_fonts = 1

" disable concealing in JSON
" let g:vim_json_syntax_conceal = 0

" just use :StripWhitespace
let g:better_whitespace_enabled = 0

" recognize all Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['c', 'cpp', 'csharp=cs', 'bash=sh', 'json']

" Add spaces  after comment delimiters by default
let g:NERDSpaceDelims = 1

" use solarized dark airline theme
let g:airline_theme='solarized'

" ctrlp


" easy motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" vim tagbar
nmap <F8> :TagbarToggle<CR>

" undotree shortcut
nmap <F5> :UndotreeToggle<CR>
" nnoremap <F5> :GundoToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Nerd tree
map <F6> :NERDTreeToggle<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-go settings
" enable syntax highlighting for functions, methods, structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" fix lag issues interaction with syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
" fix output of go commands
let g:go_list_type = "quickfix"

" YCM global extra conf
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
" do no use tab key for ycm
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" Neocomplete
" let g:neocomplete#enable_at_startup = 1

" tabular
let mapleader=','
if exists(":Tabularize")
   nmap <Leader>a= :Tabularize /=<CR>
   vmap <Leader>a= :Tabularize /=<CR>
   nmap <Leader>a: :Tabularize /:\zs<CR>
   vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" neosnippets
" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'"

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 1
inoremap <expr> <Tab>  deoplete#mappings#manual_complete()
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" UltiSnips config
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" indent guides
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

" a.vim - extends a.vim e.g. .foo -> .bar, .baz
" let g:alternateExtensions_foo = "bar, baz"

" pymode
" disable rope
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope = 0
" let g:pymode_python = 'python3'

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

if has('gui_running')
  set guifont=Inconsolata-g\ for\ Powerline\ 11
endif
