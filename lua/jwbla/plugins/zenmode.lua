return {
    'folke/zen-mode.nvim',
    opts = {
        cmd = "ZenMode",
    },
    config = function()
        vim.keymap.set('n', '<leader>zm', function()
            require('zen-mode').toggle()
        end)
    end
}
