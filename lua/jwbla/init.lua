require("jwbla.remap")
require("jwbla.set")
require("jwbla.lazy")
require("jwbla.dap-conf.dap_conf_cpp_linux")

require 'colorizer'.setup()
local autocmd = vim.api.nvim_create_autocmd
vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.laststatus=3

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- Move selected lines up
vim.api.nvim_set_keymap('v', '<A-k>', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move selected lines down
vim.api.nvim_set_keymap('v', '<A-j>', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Horizontal Split
vim.keymap.set('n', '<C-S-\\>', ':split<CR>', { noremap = true, silent = true })

-- Vertical Split (ala vscode)
vim.keymap.set('n', '<C-\\>', ':vsplit<CR>', { noremap = true, silent = true })

require('overseer').setup();

vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)
vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end)
vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end)
vim.keymap.set('n', '<F12>', function() require'dap'.step_out() end)
vim.keymap.set('n', '<leader>db', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() require'dap'.clear_breakpoints() end)


-- bind gltf to json
vim.filetype.add({
    extension = {
        gltf = "json"
    },
})
