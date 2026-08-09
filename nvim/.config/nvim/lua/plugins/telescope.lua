return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({})

            telescope.load_extension("fzf")

            local map = vim.keymap.set

            map("n", "<leader>ff", builtin.find_files, {
                desc = "Find files",
            })

            map("n", "<leader>fg", builtin.live_grep, {
                desc = "Live grep",
            })

            map("n", "<leader>fb", builtin.buffers, {
                desc = "Find buffers",
            })

            map("n", "<leader>fr", builtin.oldfiles, {
                desc = "Recent files",
            })
        end,
    },
}
