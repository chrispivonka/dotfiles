-- =============================================================================
-- Neovim configuration — entry point
-- =============================================================================

-- Set leader key before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core settings
require("options")
require("keymaps")

-- Bootstrap and load plugins
require("lazy-bootstrap")
