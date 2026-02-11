-- =============================================================================
-- Core Neovim options
-- =============================================================================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "100"
opt.showmode = false        -- shown by lualine instead
opt.pumheight = 10          -- completion menu height
opt.cmdheight = 1

-- Splits
opt.splitright = true
opt.splitbelow = true

-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true         -- persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.writebackup = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Whitespace visualization
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Line wrapping
opt.wrap = false
opt.breakindent = true

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Fold (use treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99          -- start with all folds open
opt.foldenable = true

-- Misc
opt.mouse = "a"
opt.confirm = true           -- confirm before closing unsaved
opt.iskeyword:append("-")    -- treat hyphenated words as one word
