return {
    {
        "lewis6991/gitsigns.nvim",

        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },

        config = function(_, opts)
            local gitsigns = require("gitsigns")

            gitsigns.setup(opts)

            -- LazyGit
            vim.keymap.set("n", "<leader>gg", function()
                vim.cmd("tabnew")
                vim.cmd("terminal lazygit")
                vim.cmd("startinsert")
            end, {
                desc = "LazyGit",
            })

            -- Git hunks
            vim.keymap.set("n", "<leader>gp", function()
                gitsigns.preview_hunk()
            end, {
                desc = "Preview hunk",
            })

            vim.keymap.set("n", "<leader>gs", function()
                gitsigns.stage_hunk()
            end, {
                desc = "Stage hunk",
            })

            vim.keymap.set("n", "<leader>gr", function()
                gitsigns.reset_hunk()
            end, {
                desc = "Reset hunk",
            })

            vim.keymap.set("n", "]h", function()
                gitsigns.next_hunk()
            end, {
                desc = "Next hunk",
            })

            vim.keymap.set("n", "[h", function()
                gitsigns.prev_hunk()
            end, {
                desc = "Previous hunk",
            })
        end,
    },
}
