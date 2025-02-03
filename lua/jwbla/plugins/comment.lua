return {
    'numToStr/Comment.nvim',
    opts = {},
    config = function(_, opts)
        require("Comment").setup(opts)

        -- Normal mode: Toggle comment
        vim.keymap.set("n", "<C-_>", function()
            require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment for current line" })

        vim.keymap.set("n", "<C-/>", function()
            require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment for current line (Linux)" })

        -- Visual mode: Toggle comment
        vim.keymap.set("v", "<C-_>", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment for selection" })

        vim.keymap.set("v", "<C-/>", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment for selection (Linux)" })
    end
}
