return {
    "nvim-treesitter/nvim-treesitter",
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

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    end
}

