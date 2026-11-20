vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.lazy")
require("config.keymaps")
-- Theme is now the official Mofiqul/dracula.nvim, loaded via
-- lua/plugins/dracula.lua (lazy.nvim). Old hand-rolled theme.lua is retired.
