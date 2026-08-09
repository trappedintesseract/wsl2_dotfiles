return {
    {
        "folke/trouble.nvim",

        opts = {},

        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<CR>",
                desc = "Diagnostics",
            },
            {
                "<leader>xb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                desc = "Buffer diagnostics",
            },
        },
    },
}
