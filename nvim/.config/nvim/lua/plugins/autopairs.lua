return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },

    opts = {
        check_ts = true,

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
        local npairs = require("nvim-autopairs")
        npairs.setup(opts)

        -- Integrate with nvim-cmp
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )
    end,
}
