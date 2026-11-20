return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        cmd = {
            "ObsidianOpen",
            "ObsidianNew",
            "ObsidianQuickSwitch",
            "ObsidianFollowLink",
            "ObsidianBacklinks",
            "ObsidianTags",
            "ObsidianToday",
            "ObsidianTemplate",
            "ObsidianSearch",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        opts = {
            workspaces = {
                {
                    name = "vault",
                    path = "~/vault",
                },
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            note_frontmatter_func = function(note)
                if note.title then
                    note:add_alias(note.title)
                end
                local out = { id = note.id, aliases = note.aliases or {} }
                local tags = note.tags or {}
                if #tags > 0 then
                    out.tags = tags
                end
                return out
            end,
            daily_notes = {
                folder = "sessions",
                date_format = "%Y-%m-%d",
            },
        },
        keys = {
            { "<leader>vf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Vault: find note" },
            { "<leader>vg", "<cmd>ObsidianSearch<cr>", desc = "Vault: grep search" },
            { "<leader>vn", "<cmd>ObsidianNew<cr>", desc = "Vault: new note" },
            { "<leader>vb", "<cmd>ObsidianBacklinks<cr>", desc = "Vault: backlinks" },
            { "<leader>vt", "<cmd>ObsidianToday<cr>", desc = "Vault: today's session note" },
            { "<leader>vT", "<cmd>ObsidianTags<cr>", desc = "Vault: find by tag" },
        },
    },
}
