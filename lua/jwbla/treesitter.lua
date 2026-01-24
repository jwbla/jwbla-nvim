require('nvim-treesitter').install({
    "bash",
    "c",
    "cpp",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "rust",
    "sql",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "zsh",
})

require('nvim-treesitter-textobjects').setup({
    select = { lookahead = true },
    move = { set_jumps = true },
})


-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "cpp",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "zsh",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
