return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    },
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {}
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {});
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {});
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {});
    end
}
