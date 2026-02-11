-- =============================================================================
-- Telescope — fuzzy finder
-- =============================================================================

return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { "<leader>fs", "<cmd>Telescope git_status<cr>",  desc = "Git status" },
            { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
            { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<Esc>"]  = actions.close,
                        },
                    },
                    layout_config = {
                        horizontal = { preview_width = 0.55 },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
            })

            telescope.load_extension("fzf")
        end,
    },
}
