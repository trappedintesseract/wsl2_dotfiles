return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- C / C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                },
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            -- Go
            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            -- Bash
            vim.lsp.config("bashls", {
                capabilities = capabilities,
            })

            vim.lsp.enable({
                "clangd",
                "pyright",
                "gopls",
                "lua_ls",
                "bashls",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local map = vim.keymap.set

                    map("n", "gd", vim.lsp.buf.definition, opts)
                    map("n", "gD", vim.lsp.buf.declaration, opts)
                    map("n", "gr", vim.lsp.buf.references, opts)
                    map("n", "gi", vim.lsp.buf.implementation, opts)

                    map("n", "K", vim.lsp.buf.hover, opts)

                    map("n", "<leader>lr", vim.lsp.buf.rename, opts)
                    map("n", "<leader>la", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
