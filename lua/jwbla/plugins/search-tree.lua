return {
  {
    "jwbla/search-tree.nvim",
    config = function()
      require("search-tree").setup({
        keymap = "<leader>pt",
        window = {
          position = "float",
          width = 0.8,
          height = 0.8,
        },
        ripgrep = {
          case_sensitive = false,
        },
      })
    end,
  },
}

