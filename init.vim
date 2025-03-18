"  _______| |   (_)_ __  _   _ ___
" |_  /_  / |   | | '_ \| | | / __|

" /___/___|_____|_|_| |_|\__,_|___/
"
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"if Qmpty(glob('~/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source /home/zzlinus/.config/nvim/_machine_specific.vim
" source /home/zzlinus/.config/nvim/colors/agnostic.vim

"===
"=== Cursor setings
"===
set guicursor=n-v-c:block-Cursor

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''

autocmd BufEnter * silent! lcd %:p:h

" ===
" === Editor behavior
" ===
set exrc
set secure
set number
set relativenumber
" set cursorline
" set hidden
set autochdir
set shiftwidth=2
set noexpandtab
set tabstop=2
set softtabstop=2
set autoindent
set listchars=tab:\ \ ,trail:▫
set list
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set clipboard+=unnamedplus
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set updatetime=200
set termguicolors
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q  :q<CR>
noremap qb :bdelete!<CR>
noremap <C-q> :qa<CR>
noremap S :w!<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .nvimrc<CR>

" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I


" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y
set clipboard^=unnamed,unnamedplus


" Indentation
nnoremap < <<
nnoremap > >>

" Delete find pair
nnoremap dy d%


" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" | Folding |
noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v

noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj
noremap <silent> \v v$h

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> N 5h
noremap <silent> E 5j
noremap <silent> I 5l


" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

source /home/zzlinus/.config/nvim/cursor.vim

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
noremap - N
noremap = n


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l
noremap qf <C-w>o

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source /home/zzlinus/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
"noremap <LEADER>/ :set splitright<CR>:split<CR>:res +10<CR>:term<CR>
noremap <LEADER>/ :split:res +10<CR>:term<CR>


" Press space twice to jump to the next '' and edit it
noremap <LEADER><LEADER> <Esc>/<CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

"add vim spector Variable highlight
noremap <leader>sb :call SetName()<CR>

lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{
		-- color theme
		"jpo/vim-railscasts-theme",
		"fcpg/vim-fahrenheit",
		"cange/vim-theme-bronkow",
		"joshdick/onedark.vim",
		"fcpg/vim-orbital",
		"lifepillar/vim-wwdc16-theme",
		"arzg/vim-colors-xcode",
		"sainnhe/edge",
		"andreasvc/vim-256noir",
		"yorickpeterse/happy_hacking.vim",
		"fcpg/vim-orbital",
		"vim-scripts/redstring.vim",
		"glepnir/zephyr-nvim",
		"habamax/vim-godot",
		"nvim-treesitter/nvim-treesitter",
		{"nvim-treesitter/playground"},
		"nvim-lua/plenary.nvim",
		"folke/todo-comments.nvim",
		"jalvesaq/Nvim-R", 
		"rafamadriz/neon",
		"ajmwagar/vim-deus",
		-- lsp
		"ray-x/lsp_signature.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"eandrju/cellular-automaton.nvim",
		"hrsh7th/cmp-buffer",
		"nvimdev/lspsaga.nvim",
		"simrat39/rust-tools.nvim",
		"Maan2003/lsp_lines.nvim",
		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			keys = {
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		},
		"hrsh7th/nvim-cmp",
		"kyazdani42/nvim-web-devicons",
		"p00f/clangd_extensions.nvim",
		-- little funny tools
		"airblade/vim-rooter",
		"dhruvasagar/vim-table-mode",
		-- {"RRethy/vim-hexokinase",build = "make hexokinase" },
		"kyazdani42/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"kyazdani42/nvim-tree.lua",
		"junegunn/fzf.vim",
		"junegunn/fzf",
		--{"Yggdroot/LeaderF", build = "./install.sh"},
		"nvim-telescope/telescope.nvim",
		-- debug
		-- {"puremourning/vimspector", build = "./install_gadget.py --enable-c --enable-python --enable-go"},
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"SirVer/ultisnips",
		"theniceboy/vim-snippets",
		-- git tools
		"mbbill/undotree",
		"theniceboy/vim-gitignore",
		"cohama/agit.vim",
		"lewis6991/gitsigns.nvim",
		"kdheepak/lazygit.nvim",
		-- lualine
		"nvim-lualine/lualine.nvim",
		"yorik1984/lualine-theme.nvim",
		-- Autoformat
    	"google/vim-maktaba", 
		{"google/vim-codefmt", event = "VeryLazy" },
    	"rhysd/vim-clang-format",
    	"elzr/vim-json",
    	"neoclide/jsonc.vim",
    	"othree/html5.vim",
    	"alvan/vim-closetag",
		{"hail2u/vim-css3-syntax" ,event = "VeryLazy"},
		{"spf13/PIV", event = "VeryLazy"},
    	{"pangloss/vim-javascript",  event = "VeryLazy"},
    	{"yuezk/vim-js", event = "VeryLazy"},
    	{"MaxMEllon/vim-jsx-pretty", event = "VeryLazy"},
    	{"jelera/vim-javascript-syntax", event = "VeryLazy"},
    	{"jaxbot/browserlink.vim", event = "VeryLazy"},
    	"HerringtonDarkholme/yats.vim",
    	"posva/vim-vue",
    	"evanleck/vim-svelte",
    	"leafOfTree/vim-svelte-plugin",
    	"leafgarland/typescript-vim",
    	"MaxMEllon/vim-jsx-pretty",
    	"pangloss/vim-javascript",
    	"leafgarland/typescript-vim",
    	"peitalin/vim-jsx-typescript",
    	"styled-components/vim-styled-components",
    	"pantharshit00/vim-prisma",
		-- golang
		{"fatih/vim-go",cmd = "GoInstallBinaries"},
		-- python
		{"tmhedberg/SimpylFold",event = "VeryLazy"},
    	{"Vimjas/vim-python-pep8-indent",event = "VeryLazy"},
    	{"numirias/semshi",cmd = "UpdateRemotePlugins"},
    	{"vim-scripts/indentpython.vim",event = "VeryLazy"},
    	{"tweekmonster/braceless.vim",event = "VeryLazy"},
		-- flutter
		{"dart-lang/dart-vim-plugin",event = "VeryLazy" },
		{"nvim-lua/plenary.nvim",event = "VeryLazy" },
		{"akinsho/flutter-tools.nvim",event = "VeryLazy" },
		-- markdown 
		{"instant-markdown/vim-instant-markdown", build = "yarn install", event = "VeryLazy" },
		{"mzlogin/vim-markdown-toc", event = "VeryLazy" },
		{"dkarter/bullets.vim", event = "VeryLazy" },
		{"ellisonleao/glow.nvim", event = "VeryLazy" },
		{"iamcco/markdown-preview.nvim", build = "cd app && yarn install" , event = "VeryLazy" },
		-- Editor Enhancement
		"Raimondi/delimitMate",
		"preservim/nerdcommenter",
		"jiangmiao/auto-pairs",
		"tpope/vim-surround", -- type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
		"gcmt/wildfire.vim", -- in Visual mode, type k' to select all text in '', or type k) k] k} kp
		"junegunn/vim-after-object", -- da= to delete what's after =
		"godlygeek/tabular", -- ga, or :Tabularize <regex> to align
		"tpope/vim-capslock", -- Ctrl+L (insert) to toggle capslock
		"easymotion/vim-easymotion",
		"Konfekt/FastFold",
		"junegunn/vim-peekaboo",
		"svermeulen/vim-subversive",
		"theniceboy/argtextobj.vim",
		{
			'stevearc/conform.nvim',
			opts = {},
		},
		"rhysd/clever-f.vim",
		"AndrewRadev/splitjoin.vim",
		"theniceboy/pair-maker.vim",
		"theniceboy/vim-move",
		"jeffkreeftmeijer/vim-numbertoggle",
		"lukas-reineke/indent-blankline.nvim",
		-- For general writing
		"junegunn/goyo.vim",
		"reedes/vim-wordy",
		"voldikss/vim-translator",
		-- Bookmarks
		"MattesGroeger/vim-bookmarks",
		"mhinz/vim-startify",
		"skywind3000/asynctasks.vim",
		"skywind3000/asyncrun.vim",
		-- fancy notification
		"rcarriga/nvim-notify",
		-- gruvbox color scheme
		"ellisonleao/gruvbox.nvim",
		"lifepillar/vim-gruvbox8",
		-- Other visual enhancement
		"p00f/nvim-ts-rainbow",
		"wincent/terminus",
		-- Other useful utilities
		"lambdalisue/suda.vim", -- do stuff like :sudowrite
		"makerj/vim-pdf",
		-- "xolox/vim-misc", -- vim-session dep
		-- "xolox/vim-session",
		-- Dependencies
		"MarcWeber/vim-addon-mw-utils",
		"kana/vim-textobj-user",
		"roxma/nvim-yarp",
		-- For ultisnips user.
		"onsails/lspkind-nvim",
		"norcalli/nvim-colorizer.lua",
		-- outline
		"simrat39/symbols-outline.nvim",
		-- PlatformIO
		-- highlight yank
		"machakann/vim-highlightedyank",
		-- prettier buffer line
		"akinsho/bufferline.nvim",
		-- Tabline
		"seblj/nvim-tabline",
		"rbgrouleff/bclose.vim",
		-- code runner
		"CRAG666/code_runner.nvim",

		-- shader language glsl
		"tikhomirov/vim-glsl",
		-- ssh
		"DanielWeidinger/nvim-sshfs",
		-- display assembly for the current buffer
		"p00f/godbolt.nvim",
		-- cmake intergration
		"prichrd/netrw.nvim",
		"ForsakenNGS/netdeploy.nvim",
		"Civitasv/cmake-tools.nvim",
		{
				"kawre/leetcode.nvim",
				build = ":TSUpdate html",
				dependencies = {
						"nvim-telescope/telescope.nvim",
						"nvim-lua/plenary.nvim", -- telescope 所需
						"MunifTanjim/nui.nvim",

						-- 可选
						"nvim-treesitter/nvim-treesitter",
						"rcarriga/nvim-notify",
						"nvim-tree/nvim-web-devicons",
				},
				opts = {
						-- 配置放在这里
						cn = {
								enabled = true,
						},

						description = {
								position = "left", ---@type lc.position
								width = "40%", ---@type lc.size
								show_stats = true, ---@type boolean
						},
				},
		},
	}
)
EOF
set re=0

let g:python3_host_prog = '/sbin/python3'

" experimental
"set lazyredraw
"set regexpengine=1

" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ===
" === gruvbox
" ===
"

" set background=dark
" let g:gruvbox_contrast_dark='hard'
" set pumblend=20
" hi PmenuSel blend=0
" colorscheme gruvbox

" hi! Normal ctermbg=NONE guibg=NONE

" zephyr
"colorscheme zephyr

"lua << EOF
"require("gruvbox").setup({
"    palette_overrides = {
"        dark1 = "#050007",
"    }
"})
"EOF

colorscheme gruvbox8
set background=dark
set termguicolors
set pumblend=20
hi PmenuSel blend=0
hi Normal guibg=#000000

" colorscheme gruvbox-material

" colorscheme gruvbox-flat
" vim.g.gruvbox_flat_style = "hard"
" colorscheme fennec-gruvbox
" ===
" === edge
" ===

" let g:edge_style = "neon"
" let g:edge_enable_italic = 0
" let g:edge_disable_italic_comment = 1
" let g:edge_diagnostic_text_highlight = 1
" let g:edge_diagnostic_virtual_text = 'colored'
"
" colorscheme edge
" color dracula
" color one
" color railscasts
" color orbital
" color ahrenheit
" color onedark

" color neon
" lua << EOF
" vim.g.neon_style = "dark"
" EOF

" color deus
" color ayu
" let ayucolor="light"
" color xcodedarkhc
" set cursorcolumn
set cursorline


" hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================


" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 1






" ===
" === vim-instant-markdown
" ===
"filetype plugin on
""Uncomment to override defaults:
let g:instant_markdown_slow                   = 0
let g:instant_markdown_autostart              = 0
let g:instant_markdown_open_to_the_world      = 1
let g:instant_markdown_allow_unsafe_content   = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax                = 1
let g:instant_markdown_autoscroll             = 1

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <c-f> :FZF<CR>
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <Leader>h :History<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <C-w> :Buffers<CR>
" noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-u>'],
\   '<C-j>': ['<C-e>'],
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === CTRLP (Dependency for sharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'



" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Far.vim
" ===
noremap <LEADER>f :Far  **/*<left><left><left><left><left>
let g:far#mapping = {
		\ "replace_undo" : ["l"],
		\ }


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
 inoremap <c-n> <nop>
 let g:UltiSnipsJumpForwardTrigger="<c-[>"
 let g:UltiSnipsJumpBackwardTrigger="<c-}>"
 let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
 silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
 " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
 augroup ultisnips_no_auto_expansion
     au!
     au VimEnter * au! UltiSnips_AutoTrigger
 augroup END



" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_doc_keywordprg_enabled = 0
nnoremap <silent><leader>gb :GoBuild<CR>

" ===
" === AutoFormat
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	" autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
augroup END



" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
"map E <Plug>(easymotion-j)
"map U <Plug>(easymotion-k)
"nmap f <Plug>(easymotion-overwin-f)
"map \; <Plug>(easymotion-prefix)
"nmap ' <Plug>(easymotion-overwin-f2)
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')



" ===
" === vim-session
" ===
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>




" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
" 			\   'sink': function('<sid>read_template_into_buffer')
" " noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" noremap <leader>vp :VimspectorReset<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad
"

" ===
" === reply.vim
" ===
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>


" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

"===
"=== MarkdownPreview
"===
" example
let g:mkdp_auto_start = 1
let g:mkdp_browser = 'firefox'
let g:mkdp_command_for_global = 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6
"


" ===
" === vim-move
" ===
let g:move_key_modifier = 'C'

" ===
" === any-jump
" ===
"nnoremap j :AnyJump<CR>
"let g:any_jump_window_width_ratio  = 0.8
"let g:any_jump_window_height_ratio = 0.9


" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1


" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ===
" === lazygit.nvim
" ===
" setup mapping to call :LazyGit
"
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
"===
""vim-devicons settings
"===

set encoding=UTF-8

"Can be enabled or disabled


"adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1


" ===================== End of Plugin Settings =====================

" ===
" === Terminal Colors
" ===

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
"

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif



:let g:session_autoload = 'no'

lua require'plug-colorizer'


"LSP config
"
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

"
" "nvim cmp settings
"

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },

	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			border = 'rounded',
			col_offset = -3,
			side_padding = 0,
		},
		documentation = { -- no border; native-style scrollbar
			  border = 'rounded',
			  scrollbar = '',
		},
	},
	formatting = {
	fields = { "kind", "abbr", "menu" },
	  format = require("lspkind").cmp_format({with_text = true, menu = ({
	      buffer = "[Buffer]",
	      nvim_lsp = "[LSP]",
	      ultisnips = "[UltiSnips]",
	      nvim_lua = "[Lua]",
	      latex_symbols = "[Latex]",
	    })}),
	},


	experimental = {
		native_menu = false,
		ghost_text = true,
	},

    mapping = {
			['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			['<C-l>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			['<C-j>'] = cmp.mapping.complete(),
			['<C-g>'] = cmp.mapping.close(),
			['<C-s>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
		{ name = 'nvim_lsp' },
    { name = 'vsnip' },
		{ name = 'ultisnips' ,keyword_length = 2},
		{ name = 'buffer' },
    }
  })

	require'lspconfig'.jsonls.setup {
	    commands = {
	      Format = {
	        function()
	          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
	        end
	      }
	    }
	}

	require'lspconfig'.tsserver.setup{}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
	  properties = {
	    'documentation',
	    'detail',
	    'additionalTextEdits',
	}
}
EOF

highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch			 guibg=NONE guifg=#458588
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#cc241d
highlight! CmpItemKindVariable   guibg=NONE guifg=#b8bb26
highlight! CmpItemKindInterface  guibg=NONE guifg=#8ec07c
highlight! CmpItemKindText			 guibg=NONE guifg=#f9f5d7
highlight! CmpItemKindFunction	 guibg=NONE guifg=#cc241d
highlight! CmpItemKindMethod     guibg=NONE guifg=#cc241d
highlight! CmpItemKindKeyword    guibg=NONE guifg=#8f3f71
highlight! CmpItemKindProperty   guibg=NONE guifg=#b8bb26
highlight! CmpItemKindUnit       guibg=NONE guifg=#8ec07c
highlight! CmpItemKindConstructor guibg=NONE guifg=#cc241d
highlight! CmpItemKindField      guibg=NONE guifg=#8ec07c
highlight! CmpItemKindClass      guibg=NONE guifg=#cc241d
highlight! CmpItemKindModule     guibg=NONE guifg=#076678
highlight! CmpItemKindValue      guibg=NONE guifg=#83a598
highlight! CmpItemKindEmum       guibg=NONE guifg=#cc241d
highlight! CmpItemKindSnippet    guibg=NONE guifg=#fb4934
highlight! CmpItemKindColor      guibg=NONE guifg=#cc241d
highlight! CmpItemKindFile       guibg=NONE guifg=#b8bb26
highlight! CmpItemKindReference  guibg=NONE guifg=#fb4934
highlight! CmpItemKindFolder     guibg=NONE guifg=#b8bb26
highlight! CmpItemKindEmumMember guibg=NONE guifg=#cc241d
highlight! CmpItemKindConstant   guibg=NONE guifg=#b8bb26
highlight! CmpItemKindStruct     guibg=NONE guifg=#076678
highlight! CmpItemKindEvent      guibg=NONE guifg=#076678

highlight! Pmenu guibg=#000000,guifg=#FFFFFF

highlight! LineNr guibg=#000000
highlight! SignColumn guibg=#000000
highlight! SignifySignAdd guifg=#b8bb26 guibg=#000000
highlight! SignifySignDelete guifg=#076678 guibg=#000000
highlight! SignifySignChange guifg=#cc241d guibg=#000000

highlight! GitSignsAdd    guifg=#b8bb26 guibg=#000000
highlight! GitSignsChange guifg=#cc241d guibg=#000000
highlight! GitSignsDelete guifg=#076678 guibg=#000000
highlight! GitSignsDelete guifg=#076678 guibg=#000000
highlight! GitSignsChange guifg=#cc241d guibg=#000000
highlight! GitSignsAdd    guifg=#b8bb26 guibg=#000000
highlight! GitSignsAddLn    guifg=#b8bb26 guibg=#000000
highlight! GitSignsChangeLn guifg=#cc241d guibg=#000000
highlight! GitSignsDeleteLn guifg=#076678 guibg=#000000
highlight! GitSignsDeleteLn guifg=#076678 guibg=#000000
highlight! GitSignsChangeLn guifg=#cc241d guibg=#000000
highlight! GitSignsAddLn    guifg=#b8bb26 guibg=#000000
highlight! GitSignsAddNr     guifg=#b8bb26 guibg=#000000
highlight! GitSignsChangeNr  guifg=#cc241d guibg=#000000
highlight! GitSignsDeleteNr  guifg=#076678 guibg=#000000
highlight! GitSignsDeleteNr  guifg=#076678 guibg=#000000
highlight! GitSignsChangeNr  guifg=#cc241d guibg=#000000
highlight! GitSignsAddNr     guifg=#b8bb26 guibg=#000000

hi CursorLine     guifg=none              guibg=#0f0f37


set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


lua require'python-ls'
lua require'clang-ls'
lua require'glsl-ls'
lua require'html-ls'
lua require'rust-ls'
lua require'r-ls'
lua require'vimlsp'
lua require'css-ls'
lua require'csharp-ls'
lua require'gdscript-ls'
lua require'go-ls'
lua require'lua-ls'
lua require'bash-ls'

lua require'code-runner'

lua require'nvim-dap'

lua require'tree-sitter'

"lsp trouble


"
"Lualine config
"
lua << EOF

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    always_divide_middle = true,
	  section_separators = { left = ' ', right = ' '},
	  component_separators = { left = ' ', right = ' '},
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',
						 {
                'diff',
                colored = true,
                diff_color = {
                },
                symbols = {
                    added    = " ",
                    modified = " ",
                    removed  = " "
                }
						 },
                  {'diagnostics',
										sources={'nvim_diagnostic', 'coc'},
										sections = {'error', 'warn', 'info', 'hint'},
                		diagnostics_color = {
                		},
                		symbols = {
                		    error = " ",
                		    warn  = " ",
                		    info  = " ",
                		    hint  = "ﯦ "
                		}
									}},

    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF


"
set guifont=JetBrainsMono\ NF:h12

" symbol outline
lua << EOF
require("symbols-outline").setup{
{
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = {icon = "", hl = "CmpItemAbbrMatch"},
    Module = {icon = "", hl = "CmpItemKindModule"},
    Namespace = {icon = "", hl = "CmpItemKindClass"},
    Package = {icon = "", hl = "CmpItemKindModule"},
    Class = {icon = "𝓒", hl = "CmpItemKindClass"},
    Method = {icon = "ƒ", hl = "CmpItemKindMethod"},
    Property = {icon = "", hl = "CmpItemKindMethod"},
    Field = {icon = "", hl = "CmpItemKindField"},
    Constructor = {icon = "", hl = "CmpItemKindConstructor"},
    Enum = {icon = "ℰ", hl = "CmpItemKindKeyword"},
    Interface = {icon = "ﰮ", hl = "CmpItemKindInterface"},
    Function = {icon = "", hl = "CmpItemKindFunction"},
    Variable = {icon = "", hl = "CmpItemKindVariable"},
    Constant = {icon = "", hl = "CmpItemKindConstant"},
    String = {icon = "𝓐", hl = "CmpItemKindVariable"},
    Number = {icon = "#", hl = "CmpItemKindInterface"},
    Boolean = {icon = "⊨", hl = "CmpItemKindVariable"},
    Array = {icon = "", hl = "CmpItemKindReference"},
    Object = {icon = "⦿", hl = "CmpItemKindSnippet"},
    Key = {icon = "🔐", hl = "CmpItemKindKeyword"},
    Null = {icon = "NULL", hl = "CmpItemAbbrMatchFuzzy"},
    EnumMember = {icon = "", hl = "CmpItemKindField"},
    Struct = {icon = "𝓢", hl = "CmpItemKindClass"},
    Event = {icon = "🗲", hl = "CmpItemKindClass"},
    Operator = {icon = "+", hl = "CmpItemKindVariable"},
    TypeParameter = {icon = "𝙏", hl = "CmpItemKindKeyword"}
  }
}
}
EOF
nnoremap <leader>sy :SymbolsOutline<CR>

"flutter tools

lua << EOF
  require("flutter-tools").setup{} -- use defaults
EOF



"paltformIO
" call SetupPlatformioEnvironment('/home/zz/dev/C++/platformIO_Procject/TestProject ')

" neomake
noremap <LEADER>ma :Neomake clang<CR>
noremap <LEADER>mc :NeomakeClean<CR>
let g:neomake_open_list = 2
let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \   'text': '‼',
    \   'texthl': 'NeomakeWarningSign',
    \ }
let g:neomake_message_sign = {
     \   'text': '➤',
     \   'texthl': 'NeomakeMessageSign',
     \ }
let g:neomake_info_sign = {
     \ 'text': 'ℹ',
     \ 'texthl': 'NeomakeInfoSign'
     \ }



"lsp_signature
lua << EOF
 cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = 1, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

-- -- recommanded:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
-- require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
EOF

"Godot binare
let g:godot_executable = '/usr/bin/godot'
nnoremap <leader>gdrl :GodotRunLast<CR>
nnoremap <leader>gdrn :GodotRun<CR>
nnoremap <leader>gdrc :GodotRunCurrent<CR>
nnoremap <leader>gdrf :GodotRunFZF<CR>


"
"LSP-saga confi
lua require'lspsaga-config'

" lua << EOF
" require"bufferline".setup{
" }
" EOF

"vim translator
nmap <silent> <Leader>w <Plug>TranslateW

"
"neovide
"
let g:neovide_cursor_vfx_mode = ""
let g:neovide_transparency=0.8


"ranger.vim
let g:ranger_map_keys = 0
nnoremap <leader>ra :NnnPicker<CR>

"===
"===telescope
"===

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
		defaults = {
			layout_config = {
				vertical = { width = 0.8 }
				-- other layout configuration here
			},
			mappings = {
			n = {
				["j"] = false,
				["k"] = false,
				["e"] = "move_selection_next",
				["u"] = "move_selection_previous",
				},
    }
  },
  pickers = {
		find_files = {
			theme = "dropdown",
		}
  },
  extensions = {
  }
}
EOF

"
"vim-latex-live-preview
"
let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0
let g:livepreview_engine = 'xelatex '

"godbolt
lua << EOF
require("godbolt").setup({
    languages = {
        c = { compiler = "cg112", options = {} },
        cpp = { compiler = "g112", options = {} },
        rust = { compiler = "r1590", options = {} },
        -- any_additional_filetype = { compiler = ..., options = ... },
    },
    quickfix = {
        enable = false, -- whether to populate the quickfix list in case of errors
        auto_open = false -- whether to open the quickfix list if the compiler outputs errors
    },
    url = "https://godbolt.org" -- can be changed to a different godbolt instance
})
EOF

"
"highlight duration
"
"let g:highlightedyank_highlight_duration = 230
"let g:indent_blankline_use_treesitter = v:true
"let g:indent_blankline_filetype_exclude = ['startify']
"let g:indent_blankline_indent_level = 5
"let g:indent_blankline_space_char_blankline = ' '
"highlight IndentBlanklineContextChar guifg=#cc241d gui=nocombine

lua << EOF
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

EOF


highlight! TabLineCloseSel       guibg=NONE guifg=#458588
highlight! TabLineClose          guibg=NONE guifg=#b8bb26
highlight! TabLine               guibg=NONE guifg=#8ec07c
highlight! TabLineSel            guibg=NONE guifg=#cc241d
highlight! TabLineFill           guibg=NONE guifg=#8ec07c
highlight! TabLineSeparatorSel   guibg=NONE guifg=#8f3f71
highlight! TabLineSeparator      guibg=NONE guifg=#458588
highlight! TabLineModifiedSel    guibg=NONE guifg=#cc241d
highlight! TabLineModified       guibg=NONE guifg=#076678


"tabline
lua << EOF
require('tabline').setup{
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 3,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = false,       -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
}
EOF



"fancy notify
lua require'nvim-notify'

lua require'nvimtree'
nnoremap <leader>xt :NvimTreeFindFileToggle<CR>

lua require'nvimtodo'
nnoremap <LEADER>to :TodoTelescope<CR>


"vim rooter
let g:rooter_disable_map = 1
let g:rooter_patterns = ['.git/','Cargo.toml']
let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_silent_chdir = 0


" Glow Makdown preview
"
lua << EOF
require('glow').setup({
  style = "dark",
  width = 120,
})
EOF


" org mode



let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_enable_react_fragment = 1

" cmake tools
nnoremap <leader>cg :CMakeGenerate<CR>
nnoremap <leader>cb :CMakeBuild<CR>

" nvim dap
nnoremap <leader>db <Cmd>lua require("dapui").open()<CR>
nnoremap <leader>dc <Cmd>lua require("dapui").close()<CR>
vnoremap <leader>dk <Cmd>lua require("dapui").eval()<CR>
nnoremap <leader>dh <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>do <Cmd>lua require'dap'.step_out()<CR>
nnoremap <leader>di <Cmd>lua require'dap'.step_into()<CR>
nnoremap <leader>ds <Cmd>lua require'dap'.step_over()<CR>

lua require('dap-go').setup()


" cool virtual text when diagnostic
lua << EOF
	require('gitsigns').setup()
EOF

" commenter
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 0

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 0


" leet code
"
nnoremap <leader>lt :Leet <CR>
nnoremap <leader>lr :Leet run<CR>
nnoremap <leader>ls :Leet submit<CR>
nnoremap <leader>li :Leet info<CR>
nnoremap <leader>ld :Leet daily<CR>
nnoremap <leader>fm :FormatCode<CR>
nnoremap <leader>du :NetDeployUpload<CR>
autocmd BufEnter *.PH,*.H	:setlocal filetype=cpp

nnoremap <leader>rr :CellularAutomaton make_it_rain<CR>
nnoremap <leader>rl :CellularAutomaton game_of_life<CR>

nnoremap <silent>)) :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>(( :Lspsaga diagnostic_jump_prev<CR>

hi VariableText guifg=#83a598 guibg=NONE guisp=NONE gui=NONE
hi VariableText guifg=#83a598 guibg=NONE guisp=NONE gui=NONE
hi VariableText2 guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE
hi DiagnosticError guifg=#cc241d guibg=NONE guisp=NONE gui=NONE
hi DiagnosticWarn guifg=#fabd2f guibg=NONE guisp=NONE gui=NONE

lua << EOF
vim.api.nvim_set_hl(0, "@variable", { link = "VariableText" })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "VariableText" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "VariableText" })
EOF

lua << EOF
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
		cpp = { "clang-format" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
	format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
EOF
