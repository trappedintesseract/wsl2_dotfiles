local M = {}

M.colors = {
    bg = "#1d1c19",
    fg = "#c5c9c5",
    accent = "#c8c093",
    muted = "#737c73",
    border = "#393836",

    -- Extra shades derived from the existing palette
    bg_alt = "#252421",
    bg_float = "#292824",
    fg_dim = "#a6aaa6",

    red = "#c4746e",
    orange = "#c8a36a",
    yellow = "#c8c093",
    green = "#8a9a7b",
    blue = "#7e9cd8",
    cyan = "#7aa89f",
    magenta = "#957fb8",
}

function M.setup()
    local c = M.colors

    vim.cmd("highlight clear")
    vim.g.colors_name = "custom"

    local highlights = {
        -- Editor
        Normal = { fg = c.fg, bg = c.bg },
        NormalNC = { fg = c.fg, bg = c.bg },
        CursorLine = { bg = c.bg_alt },
        CursorLineNr = { fg = c.accent, bold = true },
        LineNr = { fg = c.muted },
        SignColumn = { bg = c.bg },

        -- Splits / windows
        VertSplit = { fg = c.border, bg = c.bg },
        WinSeparator = { fg = c.border, bg = c.bg },

        -- Statusline
        StatusLine = { fg = c.fg, bg = c.bg_alt },
        StatusLineNC = { fg = c.muted, bg = c.bg },

        -- Floating windows
        NormalFloat = { fg = c.fg, bg = c.bg_float },
        FloatBorder = { fg = c.accent, bg = c.bg_float },
        FloatTitle = { fg = c.accent, bg = c.bg_float, bold = true },

        -- Popup menu
        Pmenu = { fg = c.fg, bg = c.bg_float },
        PmenuSel = { fg = c.bg, bg = c.accent, bold = true },
        PmenuSbar = { bg = c.border },
        PmenuThumb = { bg = c.muted },

        -- Search
        Search = { fg = c.bg, bg = c.accent },
        IncSearch = { fg = c.bg, bg = c.accent, bold = true },
        CurSearch = { fg = c.bg, bg = c.accent, bold = true },

        -- Visual selection
        Visual = { bg = c.border },

        -- Messages
        MsgArea = { fg = c.fg, bg = c.bg },
        MoreMsg = { fg = c.accent },
        Question = { fg = c.accent },

        -- Diagnostics
        DiagnosticError = { fg = c.red },
        DiagnosticWarn = { fg = c.orange },
        DiagnosticInfo = { fg = c.blue },
        DiagnosticHint = { fg = c.cyan },

        DiagnosticVirtualTextError = { fg = c.red, bg = c.bg },
        DiagnosticVirtualTextWarn = { fg = c.orange, bg = c.bg },
        DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.bg },
        DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.bg },

        DiagnosticUnderlineError = { undercurl = true, sp = c.red },
        DiagnosticUnderlineWarn = { undercurl = true, sp = c.orange },
        DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
        DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },

        -- Diff
        DiffAdd = { fg = c.green, bg = c.bg },
        DiffChange = { fg = c.blue, bg = c.bg },
        DiffDelete = { fg = c.red, bg = c.bg },
        DiffText = { fg = c.accent, bg = c.bg_alt },

        -- Git signs
        GitSignsAdd = { fg = c.green },
        GitSignsChange = { fg = c.blue },
        GitSignsDelete = { fg = c.red },

        -- Folding
        Folded = { fg = c.muted, bg = c.bg_alt },
        FoldColumn = { fg = c.muted, bg = c.bg },

        -- Telescope
        TelescopeNormal = { fg = c.fg, bg = c.bg_float },
        TelescopeBorder = { fg = c.border, bg = c.bg_float },
        TelescopePromptNormal = { fg = c.fg, bg = c.bg_alt },
        TelescopePromptBorder = { fg = c.accent, bg = c.bg_alt },
        TelescopePromptTitle = { fg = c.bg, bg = c.accent, bold = true },
        TelescopePreviewTitle = { fg = c.bg, bg = c.green, bold = true },
        TelescopeResultsTitle = { fg = c.bg, bg = c.blue, bold = true },
        TelescopeSelection = { fg = c.fg, bg = c.border },

        -- Which-key
        WhichKey = { fg = c.accent },
        WhichKeyGroup = { fg = c.blue },
        WhichKeyDesc = { fg = c.fg },
        WhichKeySeparator = { fg = c.muted },
        WhichKeyFloat = { bg = c.bg_float },

        -- Treesitter-ish base groups
        Comment = { fg = c.muted, italic = true },
        Constant = { fg = c.orange },
        String = { fg = c.green },
        Character = { fg = c.green },
        Number = { fg = c.orange },
        Boolean = { fg = c.orange },
        Float = { fg = c.orange },

        Identifier = { fg = c.fg },
        Function = { fg = c.blue },
        Statement = { fg = c.magenta },
        Keyword = { fg = c.magenta },
        Operator = { fg = c.accent },
        PreProc = { fg = c.magenta },
        Type = { fg = c.cyan },
        Special = { fg = c.accent },

        -- Matchparen
        MatchParen = { fg = c.accent, bold = true, underline = true },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
