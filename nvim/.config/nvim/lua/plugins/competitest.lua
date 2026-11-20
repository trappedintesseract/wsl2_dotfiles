return {
    {
        "xeluxee/competitest.nvim",

        dependencies = {
            "MunifTanjim/nui.nvim",
        },

        config = function()
            local competitest = require("competitest")

            -- macOS: plain g++ is Apple clang, which has no bits/stdc++.h
            -- or pb_ds — use Homebrew GCC when available.
            local gxx = "g++"
            for _, candidate in ipairs({ "g++-15", "g++-14", "g++-13" }) do
                if vim.fn.executable(candidate) == 1 then
                    gxx = candidate
                    break
                end
            end

            competitest.setup({
                floating_border = "rounded",

                save_current_file = true,

                -- C++
                compile_command = {
                    cpp = {
                        exec = gxx,
                        args = {
                            "-std=c++20",
                            "-O2",
                            "-pipe",
                            "$(FNAME)",
                            "-o",
                            "$(FNOEXT)",
                        },
                    },
                },

                run_command = {
                    cpp = {
                        exec = "./$(FNOEXT)",
                    },
                },

                -- Testcases
                testcases_directory = ".",
                testcases_use_single_file = false,

                testcases_input_file_format =
                "$(FNOEXT)_input$(TCNUM).txt",

                testcases_output_file_format =
                "$(FNOEXT)_output$(TCNUM).txt",

                output_compare_method = "squish",

                -- Competitive Companion
                companion_port = 27121,
                receive_print_message = true,

                -- Template
                template_file = {
                    cpp = vim.fn.stdpath("config") .. "/templates/cpp.cpp",
                },

                evaluate_template_modifiers = true,

                -- Received problems
                received_problems_path =
                "$(HOME)/CP/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",

                received_files_extension = "cpp",

                -- Received contests
                received_contests_directory =
                "$(HOME)/CP/$(JUDGE)/$(CONTEST)",

                received_contests_problems_path =
                "$(PROBLEM)/main.$(FEXT)",

                open_received_problems = true,
                open_received_contests = true,

                replace_received_testcases = false,
            })

            -- ============================================================
            -- CP keymaps
            -- ============================================================

            vim.keymap.set("n", "<leader>cr", function()
                vim.cmd("CompetiTest receive problem")
            end, {
                desc = "Receive CP problem",
            })

            vim.keymap.set("n", "<leader>cR", function()
                vim.cmd("CompetiTest receive contest")
            end, {
                desc = "Receive CP contest",
            })

            vim.keymap.set("n", "<leader>ct", function()
                vim.cmd("CompetiTest run")
            end, {
                desc = "Run CP testcases",
            })

            vim.keymap.set("n", "<leader>cT", function()
                vim.cmd("CompetiTest run_no_compile")
            end, {
                desc = "Run CP tests without compile",
            })

            vim.keymap.set("n", "<leader>cs", function()
                vim.cmd("CompetiTest show_ui")
            end, {
                desc = "Show CP testcase UI",
            })

            vim.keymap.set("n", "<leader>ci", function()
                local file = vim.fn.expand("%:p")
                local bin = vim.fn.expand("%:p:r")
                local dir = vim.fn.expand("%:p:h")

                if vim.bo.filetype ~= "cpp" then
                    vim.notify("Not a C++ buffer", vim.log.levels.WARN)
                    return
                end

                vim.cmd("write")

                local out = vim.fn.system({
                    gxx, "-std=c++20", "-O2", "-pipe", file, "-o", bin,
                })
                if vim.v.shell_error ~= 0 then
                    vim.fn.setqflist({}, " ", {
                        title = "Compile errors",
                        lines = vim.split(out, "\n", { trimempty = true }),
                        efm = "%f:%l:%c: %m,%f:%l: %m",
                    })
                    vim.cmd("copen")
                    return
                end

                vim.cmd("botright split")
                vim.cmd("lcd " .. vim.fn.fnameescape(dir))
                vim.cmd("terminal " .. vim.fn.fnameescape(bin))
                vim.cmd("startinsert")
            end, {
                desc = "Compile + run in terminal (custom stdin)",
            })
        end,
    },
}
