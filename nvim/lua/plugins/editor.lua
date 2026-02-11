-- =============================================================================
-- Editor utilities: file explorer, autopairs, comments, which-key, etc.
-- =============================================================================

return {
    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
            { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal current file" },
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = { ".git", "node_modules", ".DS_Store" },
                },
            },
            window = {
                width = 35,
                mappings = {
                    ["<space>"] = "none",
                },
            },
        },
    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Comments (gcc to toggle)
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Toggle comment" },
            { "gc",  mode = "v", desc = "Toggle comment" },
        },
        config = true,
    },

    -- Which-key (shows available keymaps)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>f", group = "Find" },
                { "<leader>h", group = "Git hunks" },
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Code" },
                { "<leader>r", group = "Rename" },
                { "<leader>t", group = "Toggle" },
            },
        },
    },

    -- Detect indent style automatically
    {
        "tpope/vim-sleuth",
        event = { "BufReadPre", "BufNewFile" },
    },

    -- Surround motions (ys, ds, cs)
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },

    -- Better escape (jk to exit insert mode)
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        opts = {
            timeout = 200,
        },
    },

    -- Todo comments highlighting
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        keys = {
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
        },
    },
}
