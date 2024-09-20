return {
    "mbbill/undotree",

    config = function()
        -- Set the keymap for toggling undotree
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

        -- Determine the operating system
        local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
        local home_dir = os.getenv("USERPROFILE") or os.getenv("HOME")  -- Get the home directory
        
        if is_windows then
            -- Set the path to your diff.exe tool using the home directory
            vim.g.undotree_diff_exe = home_dir .. '\\AppData\\Local\\nvim\\bin\\diff.exe'  -- Adjust the path as needed
        else
            -- Optional: Set a default diff tool for non-Windows systems
            vim.g.undotree_diff_exe = 'diff'
        end
    end,
}
