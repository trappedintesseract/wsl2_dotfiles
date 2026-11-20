return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        -- init, NOT config: must run BEFORE the plugin sources plugin/tmux_navigator.vim.
        -- In config it is too late — the legacy tnoremaps are already installed, and in
        -- terminal mode they type "<C-w>:TmuxNavigateLeft<cr>" as LITERAL text into TUIs
        -- (opencode) instead of switching panes.
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
    },
}
