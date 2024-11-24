" General settings
set number " Show line numbers
set relativenumber " Show relative line numbers
set autoindent " Auto indent
set tabstop=4	" Tab width
set shiftwidth=4 " Shift width
set smarttab " Smart tab
set softtabstop=4 " Soft tab (number of spaces inserted with tab key)
set mouse=a " Enable mouse support in all modes
set clipboard=unnamedplus	" Use system clipboard
set guifont=Hack\ Nerd\ Font:h12 " Set font
set encoding=utf8 " Set encoding to UTF-8
set guifont=DroidSansMono\ Nerd\ Font:h11
set splitbelow " will put the new window below the current one when using :Term

" Plugin setup using vim-plug
call plug#begin('~/.config/nvim/plugged') " specify the directory where the plugins will be installed"

" IDE stuff
Plug 'preservim/nerdtree' " NerdTree file tree explorer
Plug 'preservim/tagbar' " Tagbar for code navigation (right sidebar)
Plug 'ryanoasis/vim-devicons' " Developer file Icons in NERDTree
Plug 'vim-airline/vim-airline' " Status bar at the bottom of the screen
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vimlab/split-term.vim'
Plug 'christoomey/vim-tmux-navigator'

" Code editing
Plug 'tpope/vim-surround' " Surroundings like parentheses, quotes etc. with ysw
Plug 'tpope/vim-commentary' " For commenting and uncommenting with gcc & gc
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'psf/black', { 'branch': 'stable' } " Black python formatter (stable github branch)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter for syntax highlighting
Plug 'Chiel92/vim-autoformat' " Autoformat code on save
Plug 'jiangmiao/auto-pairs' " auto double brackets, braces ...

" Copilot plugins
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

" Colorschemes
Plug 'fenetikm/falcon'
Plug 'rose-pine/neovim' " https://github.com/will/rose-pine-neovim


call plug#end()



" ------------------------------Terminal settings-------------------------------
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

" Enable indent-blankline plugin
lua << EOF
require("ibl").setup{}
EOF

" Airline settings and symbols
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"-----------------------------Code Editing Settings--------------------------------
" Set up black to format Python files on save
autocmd BufWritePre *.py execute ':Black'
let g:black_virtualenv = '~/.local/share/nvim/black' " Specify custom path for black's virtualenv

" Enable preview in complete options
set completeopt+=preview

" Setup treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "cpp" },  -- Install the C++ parser
	highlight = {
		enable = true,               -- Enable syntax highlighting
		additional_vim_regex_highlighting = false,  -- Disable vim's regex highlighting to avoid duplication
		},
}
EOF
"
" Autoformatter (this does Autoformatting whenever :w is pressed)
autocmd BufWritePre *.py,*.cpp,*.hpp,*.h Autoformat


" Setup copilot.lua
"lua << EOF
"require('copilot').setup({
"  suggestion = {
"    auto_trigger = true,
"    keymap = {
"      accept = "<C-a>",
"      next = "<C-n>",
"      prev = "<C-p>",
"      dismiss = "<C-d>",
"    },
"  },
"})
"EOF

" Setup CopilotChat
"lua << EOF
"require("CopilotChat").setup {
"  debug = true, -- Enable debugging
"  -- Additional configuration can be added here
"}
"EOF

" -------------------------Colorscheme settings----------------------------
let g:falcon_airline = 1  " Enable Falcon airline support
let g:airline_powerline_fonts = 1
let g:airline_theme = 'falcon'  " Set Falcon colorscheme for airline

" Optional: Control background and inactive styling
let g:falcon_background = 1 " Disable setting background color (optional)
let g:falcon_inactive = 1  " Enable inactive window styling (optional)

" Colorscheme settings
colorscheme falcon  " Set Falcon as the colorscheme


