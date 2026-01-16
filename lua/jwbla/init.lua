require("jwbla.remap")
require("jwbla.set")
require("jwbla.lazy")

require 'colorizer'.setup()
local autocmd = vim.api.nvim_create_autocmd
vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.laststatus=3
vim.opt.foldmethod="indent"

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

-- ctrl+backspace deletes word in insert mode
vim.keymap.set('i', '<C-h>', '<C-w>')

require('overseer').setup();

-- bind gltf to json
vim.filetype.add({
    extension = {
        gltf = "json"
    },
})

-- create word wrap macro
vim.api.nvim_create_user_command('WordWrap', function()
  if vim.wo.wrap and vim.wo.linebreak then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    print("Word Wrap: off")
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    print("Word Wrap: on")
  end
end, { bang = false, bar = true })
