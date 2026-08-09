return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,

        config = function()
            vim.g.tmux_navigator_no_mappings = 1

            vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", {
                silent = true,
                desc = "Navigate left",
            })

            vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", {
                silent = true,
                desc = "Navigate down",
            })

            vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", {
                silent = true,
                desc = "Navigate up",
            })

            vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", {
                silent = true,
                desc = "Navigate right",
            })
        end,
    },
}
