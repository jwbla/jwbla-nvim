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



function RunSelectionInFTerm()
  local start_line, start_col = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
  local end_line, end_col = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

  -- Get selected text
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  if #lines == 0 then return end

  -- If only one line, respect start and end columns
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_col, end_col)
  end

  -- Join lines and trim whitespace
  local command = table.concat(lines, "\n"):gsub("^%s*(.-)%s*$", "%1")

  if command == "" then return end

  -- Run in FTerm
  require("FTerm").scratch({ cmd = command })
end

-- Map it to a keybinding in visual mode
vim.api.nvim_set_keymap("v", "<leader>r", ":lua RunSelectionInFTerm()<CR>", { noremap = true, silent = true })

function JSReplFTerm()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:p") -- Get full path of the current file

  if filetype == "javascript" and vim.fn.filereadable(filename) == 1 then
    -- If inside a .js file, run the file
    require("FTerm").scratch({ cmd = "node " .. vim.fn.shellescape(filename) })
  else
    -- Otherwise, open the Node.js REPL
    require("FTerm").scratch({ cmd = "node" })
  end
end

vim.api.nvim_set_keymap("n", "<leader>js", ":lua JSReplFTerm()<CR>", { noremap = true, silent = true })


