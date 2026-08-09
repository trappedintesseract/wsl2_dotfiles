return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "c",
                "cpp",
                "python",
                "go",
                "lua",
                "bash",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "c",
                    "cpp",
                    "python",
                    "go",
                    "lua",
                    "bash",
                },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
