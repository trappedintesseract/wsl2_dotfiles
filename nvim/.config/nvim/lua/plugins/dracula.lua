return {
    {
        -- Official Dracula port for Neovim: github.com/Mofiqul/dracula.nvim
        "Mofiqul/dracula.nvim",
        lazy = false,    -- load at startup: it sets the colorscheme
        priority = 1000, -- load before other UI plugins
        config = function()
            local dracula = require("dracula")
            dracula.setup({
                transparent_bg = false,
                italic_comment = true,
                -- Official overrides API. Vanilla dracula.nvim draws split
                -- separators in near-black (#21222c) which is invisible on the
                -- #282a36 bg. Use the comment color so splits are clearly
                -- separated but still subtle/on-theme.
                overrides = function(colors)
                    return {
                        WinSeparator = { fg = colors.comment },
                        VertSplit = { fg = colors.comment },
                    }
                end,
            })
            vim.cmd.colorscheme("dracula")
        end,
    },
}
