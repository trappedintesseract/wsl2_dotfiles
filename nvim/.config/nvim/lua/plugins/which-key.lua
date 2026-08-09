return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        opts = {
            spec = {
                {
                    "<leader>f",
                    group = "find",
                },
                {
                    "<leader>e",
                    desc = "File explorer",
                },
            },
        },
    },
}
