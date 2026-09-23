return {
    {
        "mfussenegger/nvim-dap",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- DAP UI
            dapui.setup()

            -- Open UI automatically when debugging starts
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            -- Close UI when debugging ends
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- GDB native DAP adapter
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = {
                    "--interpreter=dap",
                    "--eval-command",
                    "set print pretty on",
                },
            }

            -- C
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",

                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,

                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            -- C++
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",

                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,

                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }
            -- Python / debugpy
            dap.adapters.python = {
                type = "executable",
                command = vim.fn.expand("~/.local/share/nvim/python-env/bin/python"),
                args = { "-m", "debugpy.adapter" },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch current file",
                    program = "${file}",
                    pythonPath = vim.fn.expand("~/.local/share/nvim/python-env/bin/python"),
                    console = "integratedTerminal",
                },
            }
            -- Debugger controls

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
                desc = "Toggle breakpoint",
            })

            vim.keymap.set("n", "<leader>dc", dap.continue, {
                desc = "Continue",
            })

            vim.keymap.set("n", "<leader>di", dap.step_into, {
                desc = "Step into",
            })

            vim.keymap.set("n", "<leader>do", dap.step_over, {
                desc = "Step over",
            })

            vim.keymap.set("n", "<leader>dx", dap.step_out, {
                desc = "Step out",
            })

            vim.keymap.set("n", "<leader>dt", dap.terminate, {
                desc = "Terminate",
            })

            -- Toggle debugger UI manually
            vim.keymap.set("n", "<leader>du", dapui.toggle, {
                desc = "Toggle debugger UI",
            })

            -- Evaluate expression under cursor
            vim.keymap.set({ "n", "v" }, "<leader>de", function()
                dapui.eval(nil, {
                    enter = true,
                })
            end, {
                desc = "Evaluate expression",
            })
        end,
    },
}
