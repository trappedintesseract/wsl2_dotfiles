return {
    {
        "xeluxee/competitest.nvim",

        dependencies = {
            "MunifTanjim/nui.nvim",
        },

        config = function()
            local competitest = require("competitest")

            competitest.setup({
                floating_border = "rounded",

                save_current_file = true,

                -- C++
                compile_command = {
                    cpp = {
                        exec = "g++",
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
        end,
    },
}
