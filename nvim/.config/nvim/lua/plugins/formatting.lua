return {
    {
        "stevearc/conform.nvim",

        event = { "BufWritePre" },

        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                python = { "ruff_format" },
                go = { "gofmt" },
            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
        },

        config = function(_, opts)
            require("conform").setup(opts)

            vim.keymap.set("n", "<leader>lf", function()
                require("conform").format({
                    async = true,
                    lsp_fallback = true,
                })
            end, {
                desc = "Format file",
            })
        end,
    },
}
