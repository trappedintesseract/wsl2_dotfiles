return {
    {
        "mfussenegger/nvim-lint",

        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                python = { "ruff" },
                c = { "clangtidy" },
                cpp = { "clangtidy" },
                go = { "golangcilint" },
            }

            -- Only run linters whose binary is actually installed, otherwise
            -- nvim-lint spams "command not found" on every save.
            local function lint_if_available()
                local names = lint.linters_by_ft[vim.bo.filetype]
                if not names then
                    return
                end

                local runnable = {}
                for _, name in ipairs(names) do
                    local linter = lint.linters[name]
                    local cmd = type(linter) == "table" and linter.cmd or name
                    if vim.fn.executable(cmd) == 1 then
                        table.insert(runnable, name)
                    end
                end

                if #runnable > 0 then
                    lint.try_lint(runnable)
                end
            end

            vim.api.nvim_create_autocmd({
                "BufEnter",
                "BufWritePost",
                "InsertLeave",
            }, {
                callback = lint_if_available,
            })
        end,
    },
}
