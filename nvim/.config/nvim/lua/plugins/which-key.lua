return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        opts = {
            spec = {
                { "<leader>c", group = "CP" },
                { "<leader>v", group = "Notes" },
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
