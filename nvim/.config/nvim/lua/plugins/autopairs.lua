return {
    {
        "windwp/nvim-autopairs",

        event = "InsertEnter",

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            check_ts = true, -- treesitter-aware pairing

            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                javascriptreact = { "template_string" },
                typescript = { "template_string" },
                typescriptreact = { "template_string" },
            },

            disable_filetype = {
                "TelescopePrompt",
                "vim",
                "help",
                "lazy",
                "mason",
            },

            enable_check_bracket_line = false,
            enable_moveright = true,
            enable_afterquote = true,
            map_bs = true,
            map_c_h = true,
            map_c_w = true,
        },

        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- Insert "(" automatically after confirming a function/method
            -- completion in nvim-cmp
            local ok, cmp = pcall(require, "cmp")
            if ok then
                cmp.event:on(
                    "confirm_done",
                    require("nvim-autopairs.completion.cmp").on_confirm_done()
                )
            end
        end,
    },
}
