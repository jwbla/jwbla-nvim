return {
    'numToStr/Comment.nvim',
    opts = {
        -- Enable default mappings
        mappings = {
            basic = true,
            extra = true,
        },
    },
    config = function(_, opts)
        require("Comment").setup(opts)

        -- Ctrl + / in Normal mode
        vim.keymap.set("n", "<C-_>", function()
            require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment for current line" })

        -- Ctrl + / in Visual mode
        vim.keymap.set("v", "<C-_>", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment for selection" })
    end
}
