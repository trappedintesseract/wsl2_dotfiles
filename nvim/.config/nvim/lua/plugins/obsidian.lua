return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        lazy = true,
        cmd = "Obsidian",
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/notes/**.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        ---@module "obsidian"
        ---@type obsidian.config
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "notes",
                    path = "~/notes",
                },
            },
            picker = {
                name = "telescope.nvim",
            },
            completion = {
                min_chars = 2,
            },
            daily_notes = {
                folder = "sessions",
                date_format = "%Y-%m-%d",
            },
        },
        config = function(_, opts)
            vim.fn.mkdir(vim.fn.expand("~/notes"), "p")
            require("obsidian").setup(opts)
        end,
        keys = {
            { "<leader>vf", "<cmd>Obsidian quick_switch<cr>", desc = "Notes: find note" },
            { "<leader>vg", "<cmd>Obsidian search<cr>", desc = "Notes: grep search" },
            { "<leader>vn", "<cmd>Obsidian new<cr>", desc = "Notes: new note" },
            { "<leader>vb", "<cmd>Obsidian backlinks<cr>", desc = "Notes: backlinks" },
            { "<leader>vt", "<cmd>Obsidian today<cr>", desc = "Notes: today's note" },
            { "<leader>vT", "<cmd>Obsidian tags<cr>", desc = "Notes: find by tag" },
        },
    },
}
