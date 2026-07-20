-- =============================================================================
-- AI coding assistant — codecompanion.nvim
-- Supports Copilot (default, uses existing GitHub auth), Anthropic, OpenAI,
-- Gemini, and more. Set ANTHROPIC_API_KEY / OPENAI_API_KEY in ~/.zshrc.local
-- =============================================================================

return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
        keys = {
            { "<leader>aa", "<cmd>CodeCompanionActions<cr>",         mode = { "n", "v" }, desc = "AI Actions" },
            { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>",     mode = { "n", "v" }, desc = "AI Chat" },
            { "<leader>ai", "<cmd>CodeCompanion<cr>",                mode = { "n", "v" }, desc = "AI Inline" },
            { "<leader>ab", "<cmd>CodeCompanionChat Add<cr>",        mode = "v",          desc = "Add selection to chat" },
        },
        opts = {
            adapters = {
                -- Copilot: no separate API key needed — uses GitHub auth (gh cli)
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {})
                end,
                -- Anthropic: set ANTHROPIC_API_KEY in ~/.zshrc.local
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        env = { api_key = "ANTHROPIC_API_KEY" },
                    })
                end,
            },
            strategies = {
                -- Default to Copilot (no API key needed); change to "anthropic" if preferred
                chat   = { adapter = "copilot" },
                inline = { adapter = "copilot" },
                cmd    = { adapter = "copilot" },
            },
            display = {
                action_palette = { provider = "snacks" },
                chat = {
                    intro_message = "CodeCompanion ready. Press ? for help.",
                    window = {
                        layout = "vertical",
                        width = 0.35,
                    },
                },
            },
        },
    },
}
