return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        opts = {
            spec = {
                { "<leader>c", group = "CP / Claude" },
                { "<leader>o", group = "OpenCode" },
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
