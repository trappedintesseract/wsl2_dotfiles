local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true

opt.cursorline = true

-- Consistency with terminal/opencode: steady block cursor in every mode,
-- and lualine owns the statusline so hide the redundant -- INSERT -- text.
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
opt.showmode = false
opt.laststatus = 3

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.mouse = "a"

opt.clipboard = "unnamedplus"

opt.undofile = true

opt.updatetime = 250

opt.timeoutlen = 500

-- WSL2 ↔ Windows clipboard
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",

        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },

        paste = {
            ["+"] = {
                "powershell.exe",
                "-NoLogo",
                "-NoProfile",
                "-Command",
                '[Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
            },

            ["*"] = {
                "powershell.exe",
                "-NoLogo",
                "-NoProfile",
                "-Command",
                '[Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
            },
        },

        cache_enabled = 0,
    }
end
-- Python provider (molten needs pynvim). Use the dedicated nvim venv if it
-- exists, else fall back to whatever python3 is on PATH.
local py_env = vim.fn.expand("~/.local/share/nvim/python-env/bin/python")
if vim.uv.fs_stat(py_env) then
    vim.g.python3_host_prog = py_env
else
    local py = vim.fn.exepath("python3")
    if py ~= "" then
        vim.g.python3_host_prog = py
    end
end
