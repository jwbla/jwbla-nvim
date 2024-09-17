return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "cpp",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "typescript",
                "javascript",
                "java",
                "sql",
                "yaml",
                "json",
                "markdown",
            },

            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}

