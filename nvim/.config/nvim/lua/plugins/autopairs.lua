return {
    {
        "windwp/nvim-autopairs",

        event = "InsertEnter",

        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- treesitter-aware pairing
            })

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
