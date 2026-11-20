return {
    {
        "nickjvandyke/opencode.nvim",
        version = "*", -- Latest stable release
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {
                server = {
                    -- Don't open opencode inside nvim (the in-editor term://
                    -- vsplit is glitchy). Connect to a `opencode --port` in a
                    -- tmux pane/window sharing nvim's CWD; if none is running,
                    -- spawn one in a new tmux window instead of a vsplit.
                    -- ~/.config/opencode is the unified config (Databricks
                    -- providers + ucode-auth.js), so no XDG indirection needed.
                    start = function()
                        if vim.env.TMUX then
                            vim.fn.system({
                                "tmux",
                                "new-window",
                                "-n",
                                "opencode",
                                "-c",
                                vim.fn.getcwd(),
                                "opencode --port",
                            })
                        else
                            vim.cmd("vsplit term://opencode --port | wincmd p")
                        end
                    end,
                },
            }

            -- Keymaps under <leader>o (tmux-safe; matches Claude Code's <leader>c convention)
            vim.keymap.set({ "n", "x" }, "<leader>oa", function()
                require("opencode").ask("@this: ")
            end, { desc = "Ask OpenCode" })

            vim.keymap.set({ "n", "x" }, "<leader>os", function()
                require("opencode").select()
            end, { desc = "Select OpenCode" })

            vim.keymap.set({ "n" }, "<leader>on", function()
                require("opencode").command("session.new")
            end, { desc = "New OpenCode session" })

            vim.keymap.set({ "n" }, "<leader>oi", function()
                require("opencode").command("session.interrupt")
            end, { desc = "Interrupt OpenCode" })

            -- Operator (no conflict): append range / line to OpenCode
            vim.keymap.set({ "n", "x" }, "go", function()
                return require("opencode").operator("@this ")
            end, { desc = "Append range to OpenCode", expr = true })

            vim.keymap.set({ "n" }, "goo", function()
                return require("opencode").operator("@this ") .. "_"
            end, { desc = "Append line to OpenCode", expr = true })

            vim.keymap.set({ "n" }, "<leader>ou", function()
                require("opencode").command("session.half.page.up")
            end, { desc = "Scroll OpenCode up" })

            vim.keymap.set({ "n" }, "<leader>od", function()
                require("opencode").command("session.half.page.down")
            end, { desc = "Scroll OpenCode down" })
        end,
    },
}
