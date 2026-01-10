vim.keymap.set({ "n" }, "<Esc>", ":nohlsearch<cr>", { silent = true, desc = "Clear search highlight" })
vim.keymap.set({ "n" }, "q", "<Nop>", { silent = true, desc = "Nvim: Disable q" })
vim.keymap.set({ "n" }, "<leader>dl", vim.diagnostic.setloclist, { desc = "Open Quickfix list" })
vim.keymap.set({ "n" }, "<leader>dd", vim.diagnostic.open_float, { desc = "Open Diagnostic Float Window" })

vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>wincmd h<cr>", { desc = "Window: Move focus to the left" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Window: Move focus to the bottom" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Window: Move focus to the top" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>wincmd l<cr>", { desc = "Window: Move focus to the right" })

vim.keymap.set({ "n" }, "<C-Tab>", "<C-w>w", { desc = "Focus: Next window" })

vim.keymap.set({ "t" }, "<C-Escape>", "<C-\\><C-n>", { desc = "Terminal: Set normal mode" })

vim.keymap.set({ "n" }, "<C-Down>", ":resize +2<cr>", { desc = "Window: Increase horizontal", silent = true })
vim.keymap.set({ "n" }, "<C-Up>", ":resize -2<cr>", { desc = "Window: Descrease horizontal", silent = true })
vim.keymap.set({ "n" }, "<C-Left>", ":vertical resize -2<cr>", { desc = "Window: Descrease vertical", silent = true })
vim.keymap.set({ "n" }, "<C-Right>", ":vertical resize +2<cr>", { desc = "Window: Increase vertical", silent = true })

vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Cursor: Move to line start" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Cursor: Move to line end" })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set({ "v" }, ">", ">gv", { desc = "Text: Move right" })
vim.keymap.set({ "v" }, "<", "<gv", { desc = "Text: Move left" })
vim.keymap.set({ "v" }, "J", ":move+1<cr>gv", { silent = true, desc = "Text: Move down" })
vim.keymap.set({ "v" }, "K", ":move-2<cr>gv", { silent = true, desc = "Text: Move up" })
