local map = vim.keymap.set

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Split navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right" })

-- Basic file operations
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
-- Diagnostics
map("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic",
})

map("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})

map("n", "<leader>xd", vim.diagnostic.open_float, {
    desc = "Show diagnostic",
})

map("n", "<leader>xx", vim.diagnostic.setloclist, {
    desc = "Diagnostics",
})
-- ============================================================================
-- Molten / Jupyter
-- ============================================================================

map("n", "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", { desc = "Jupyter: Evaluate line" })
map("v", "<leader>me", "<cmd>MoltenEvaluateVisual<CR>", { desc = "Jupyter: Evaluate selection" })
map("n", "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", { desc = "Jupyter: Re-evaluate cell" })
map("n", "<leader>mx", "<cmd>MoltenInterrupt<CR>", { desc = "Jupyter: Interrupt" })
map("n", "<leader>mo", "<cmd>MoltenHideOutput<CR>", { desc = "Jupyter: Hide output" })
