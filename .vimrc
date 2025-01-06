" General Settings
set number                 " Show line numbers
set relativenumber         " Show relative line numbers
set autoindent             " Enable automatic indentation
set tabstop=4              " Tab width
set shiftwidth=4           " Shift width
set smarttab               " Enable smart tabs
set softtabstop=4          " Soft tab width (spaces inserted)
set mouse=a                " Enable mouse support
set clipboard=unnamedplus  " Use system clipboard
set encoding=utf-8         " Set encoding to UTF-8
set splitbelow             " Open horizontal splits below the current window
set splitright             " Open vertical splits to the right
set termguicolors          " Enable true color support for better themes
set background=dark        " Set background to dark

" Plugin Setup with vim-plug
call plug#begin('~/.vim/plugged')

" File Explorer and Navigation
Plug 'preservim/nerdtree'             " File tree explorer
Plug 'preservim/tagbar'               " Code navigation sidebar
Plug 'ryanoasis/vim-devicons'         " Developer icons
Plug 'vim-airline/vim-airline'        " Status bar

" Code Editing Enhancements
Plug 'tpope/vim-surround'             " Manage surroundings (quotes, parentheses)
Plug 'tpope/vim-commentary'           " Comment/uncomment with `gc`
Plug 'terryma/vim-multiple-cursors'   " Multiple cursors
Plug 'jiangmiao/auto-pairs'           " Auto-closing brackets
Plug 'Chiel92/vim-autoformat'         " Autoformat code
" Plug 'vim-python/black', { 'branch': 'stable' } " Python code formatter
Plug 'sheerun/vim-polyglot'           " Syntax highlighting for multiple languages

" Terminal Integration
Plug 'vimlab/split-term.vim'          " Easy terminal splits
" Plug 'christoomey/vim-tmux-navigator' " Tmux navigation

" Colorschemes
Plug 'arzg/vim-colors-xcode'



call plug#end()

" Plugin Configurations
" NERDTree settings and key mappings
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let NERDTreeShowHidden=1
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <C-z> u
nnoremap <F3> :Autoformat<CR>
     " Toggle Tagbar
	 "
" Change cursor shape in different modes
if exists('&t_SI') && exists('&t_EI')
    let &t_SI = "\e[5 q"  " Use line cursor in insert mode
    let &t_EI = "\e[1 q"  " Use block cursor in normal mode
    let &t_SR = "\e[3 q"  " Use underline cursor in replace mode
endif

" Autoformat on Save
autocmd BufWritePre *.py,*.cpp,*.h Autoformat

" Black Formatter for Python
let g:black_virtualenv = '~/.local/share/nvim/black'

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'xcodedarkhc'

" Multiple Cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Autoformat with Black on Save
autocmd BufWritePre *.py execute ':Black'


" Colorscheme Configuration
colorscheme xcodedarkhc

" Terminal Split Mappings
nnoremap <C-ö> :Term<CR>              " Open a terminal split
tnoremap <C-ä> <C-\><C-n>             " Escape terminal mode
