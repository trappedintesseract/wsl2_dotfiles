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
vim.g.python3_host_prog =
    vim.fn.expand("~/.local/share/nvim/python-env/bin/python")
