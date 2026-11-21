return {
    {
        "mfussenegger/nvim-dap",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
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

            -- Native DAP adapter.
            -- Linux/WSL: gdb --interpreter=dap.
            -- macOS: gdb is unsigned/unavailable on Apple Silicon, so use
            -- lldb-dap from the Xcode Command Line Tools instead.
            if vim.uv.os_uname().sysname == "Darwin" then
                local lldb_dap = vim.fn.exepath("lldb-dap")
                if lldb_dap == "" then
                    lldb_dap =
                        "/Library/Developer/CommandLineTools/usr/bin/lldb-dap"
                end

                dap.adapters.gdb = {
                    type = "executable",
                    command = lldb_dap,
                }
            else
                dap.adapters.gdb = {
                    type = "executable",
                    command = "gdb",
                    args = {
                        "--interpreter=dap",
                        "--eval-command",
                        "set print pretty on",
                    },
                }
            end

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

            local python = vim.fn.exepath("python3")
            local py_env = vim.fn.expand("~/.local/share/nvim/python-env/bin/python")
            if vim.fn.executable(py_env) == 1 then
                python = py_env
            end
            require("dap-python").setup(python)

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
