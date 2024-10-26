vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word under cursor
-- This block CTRL+HJKL to move between windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
-- This block remaps ALT+,.ts to resize windows
vim.api.nvim_set_keymap("n", "<M-,>", "<c-w>5<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-.>", "<c-w>5>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-t>", "<C-W>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-s>", "<C-W>-", { noremap = true, silent = true })

-- This is just for fun
vim.api.nvim_set_keymap("n", "<leader>fu", "<cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true})

-- Git blame
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true})
