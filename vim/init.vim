set nocompatible            " disable compatibility to old-time vi
set completeopt=menuone,noselect,noinsert "nicer popup menu for completions
set shortmess+=c            " shorter hit Enter messages
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
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
set textwidth=80
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
syntax on                   " syntax highlighting

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()

"RUST
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'ncm2/ncm2-racer'
" Plug 'sebastianmarkow/deoplete-rust'

"PYTHON
Plug 'ncm2/ncm2'
Plug 'nvie/vim-flake8'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'davidhalter/jedi-vim'
" Plug 'fisadev/vim-isort'
Plug 'vim-syntastic/syntastic'
" Plug 'vim-python/python-syntax'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"JAVASCRIPT
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'

"TEX
Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'matze/vim-tex-fold'

"MATLAB
Plug 'raingo/vim-matlab'

"GENERAL
" Plug 'dominikduda/vim_current_word', { 'for': ['matlab']}
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'elzr/vim-json'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'roxma/vim-tmux-clipboard'
" Plug 'jiangmiao/auto-pairs'

"PRETTIER
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'branch': 'release/1.x',
"   \ 'for': [
"     \ 'javascript',
"     \ 'typescript',
"     \ 'css',
"     \ 'less',
"     \ 'scss',
"     \ 'json',
"     \ 'graphql',
"     \ 'markdown',
"     \ 'vue',
"     \ 'lua',
"     \ 'php',
"     \ 'python',
"     \ 'ruby',
"     \ 'html',
"     \ 'swift'] }

"HTML
"
Plug 'mattn/emmet-vim'

"COLOR SCHEMES
"Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
" Plug 'morhetz/gruvbox'
" Plug 'levelone/tequila-sunrise.vim'

call plug#end()

colorscheme OceanicNext
"colorscheme gruvbox
"colorscheme solarized8
" colorscheme tequila-sunrise

" ######################################################

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["rust"],
    \ "passive_filetypes": [] }

let python_highlight_all=1

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_view_general_viewer = 'open -a Skim'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
"let g:vimtex_fold_manual = 1
"let g:tex_fold_override_foldtext = 1
"let g:tex_fold_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0
"let g:livepreview_previewer = 'open -a Skim'

let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'

let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 2
"let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -rf'
let g:netrw_keepdir=0

let g:ale_linters = {'javascript': ['eslint'], 'matlab': ['mlint'], 'python': ['flake8'], 'rust': ['rustc']}
let g:ale_fixers = {'javascript': ['eslint'], 'python': ['yapf', 'autopep8'], 'css': ['prettier'], 'html': ['prettier'], 'rust': ['rustfmt']}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_check = 1

let g:neoformat_only_msg_on_error = 1

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]

let g:ncm2#matcher = 'substrfuzzy'

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

autocmd InsertEnter,InsertLeave * set cul!
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufEnter * call ncm2#enable_for_buffer()

vmap i <Esc>i
"
" tab ipv % voor parenmatch
nnoremap <tab> %
vnoremap <tab> %

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <space> za

"MATLAB-VIM bindings
autocmd FileType matlab source ~/.config/nvim/matlab.vim

" Clipboard yank
vmap Y "*y

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

"Neoformat

augroup fmt
  autocmd!
  autocmd BufWritePre *.m undojoin | Neoformat
augroup END

autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us

autocmd FileType matlab setlocal commentstring=%\ %s

autocmd FileType python nnoremap <buffer> <C-y> :exec '!python' shellescape(@%, 1)<CR>
autocmd FileType rust nnoremap <buffer> <C-y> :exec '!cargo run' shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <buffer> <C-y> :VimtexCompile<CR>

autocmd CursorMoved *.m exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
