set nocompatible            " disable compatibility to old-time vi
set completeopt=menuone,noselect,noinsert,longest "nicer popup menu for completions
set shortmess+=c            " shorter hit Enter messages
set showmatch               " show matching brackets.
" set ignorecase              " case insensitive matching
set wrap                    " wrap visually, not actually
set hlsearch                " highlight search results
set tabstop=2               " number of default columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set autochdir               " sets working dir = edit dir
set textwidth=88
set splitbelow
set splitright
set spelllang=en_us
set statusline+=%F
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set background=dark
set t_Co=256
set nobackup
set noswapfile
filetype plugin indent on   " allows auto-indenting depending on file type
syntax enable                   " syntax highlighting

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()

"GENERAL
Plug 'majutsushi/tagbar'
Plug 'yegappan/taglist'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
"completion
Plug 'Shougo/deoplete.nvim'
"search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"PYTHON
"completion
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
"syntax highlights
Plug 'numirias/semshi'

"JAVASCRIPT
"completion
Plug 'carlitux/deoplete-ternjs'
"syntax highlights
Plug 'pangloss/vim-javascript'

"COLOR SCHEMES
Plug 'mhartington/oceanic-next'

"TEX
Plug 'lervag/vimtex'

"RUST
"completion
Plug 'sebastianmarkow/deoplete-rust'
Plug 'rust-lang/rust.vim'

"MARKDOWN
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme OceanicNext

let g:python3_host_prog ='/usr/bin/python3'
let g:python2_host_prog ='/usr/bin/python2'

"GENERAL KEYS
nmap U <C-R>
vmap i <Esc>i
"
" tab ipv % voor parenmatch
nnoremap <tab> %
vnoremap <tab> %

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Completion

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


nnoremap <space> za

vmap Y "*y

map j gj
map k gk

nmap <C-c> :tabnew ~/.config/nvim/init.vim<CR>

nmap gb <C-w>s<C-w>

nmap ++ :res +10<CR>
nmap -- :res -10<CR>
nmap -+ :vertical res +10<CR>
nmap -= :vertical res -10<CR>

"COMPILE
autocmd FileType python nnoremap <buffer> <C-y> :exec '!python' shellescape(@%, 1)<CR>
autocmd FileType rust nnoremap <buffer> <C-y> :exec '!cargo run'<CR>
autocmd FileType rust nnoremap gy :exec '!cargo test'<CR>
autocmd FileType rust nnoremap gY :exec '!cargo test -- --nocapture'<CR>
autocmd FileType tex nnoremap <buffer> <C-y> :VimtexCompile<CR>

"ALE
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8'], 'rust': ['rustc']}
let g:ale_fixers = {'javascript': ['eslint'], 'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_check = 1

"SYNTAX
"deoplete
let g:deoplete#enable_at_startup = 1
autocmd FileType mail setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

"syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["rust"],
    \ "passive_filetypes": [] }

"RUST
let g:deoplete#sources#rust#racer_binary='/home/paul/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/paul/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

let g:rustfmt_autosave = 1

"TAGBAR/LIST
let g:tagbar_compact = 1
nmap <C-t> :TagbarToggle<CR>

"FZF
nmap <C-p> :FZF<CR>
nnoremap <C-a> :Ag<CR>

"SPELL
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us

"MOTULUS
nmap <C-s> :! scp % pdelange@storm.motulus.com:/home/pdelange/scripts && ssh pdelange@storm.motulus.com source /home/pdelange/run.sh %<CR>


"TEX
let g:tex_flavor  = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0

"SKELETONS
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
    autocmd BufNewFile *article.tex 0r ~/.config/nvim/templates/article_skeleton.tex
    autocmd BufNewFile *letter.tex 0r ~/.config/nvim/templates/letter_skeleton.tex
    autocmd BufNewFile *notes.tex 0r ~/.config/nvim/templates/notes_skeleton.tex
    autocmd BufNewFile *dictionary.tex 0r ~/.config/nvim/templates/dictionary_skeleton.tex
    autocmd BufNewFile .eslintrc 0r ~/.config/nvim/templates/eslint_skeleton.json
  augroup END
endif


