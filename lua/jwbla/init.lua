require("jwbla.remap")
require("jwbla.set")
require("jwbla.lazy")

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


vim.cmd([[
function! ClearYankRegisters()
    " Clear alphabetic registers a to z
    for i in range(char2nr('a'), char2nr('z'))
        execute 'let @' . nr2char(i) . ' = ""'
    endfor

    " Clear numbered registers 1 to 9
    for i in range(1, 9)
        execute 'let @' . i . ' = ""'
    endfor

    " Clear specific special registers
    let @0 = ''
    let @+ = ''
    let @* = ''
    let @" = ''
    let @- = ''
    let @# = ''  " Might be read-only, but we attempt for completeness
    let @= = ''  " Expression register
    let @/ = ''

    " Skip clearing % register as it is read-only and contains the current file name
endfunction

command! ClearYanks call ClearYankRegisters()
]])
