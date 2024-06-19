return {
    "mfussenegger/nvim-dap",
    config = function ()
        -- keybindings
        local opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap('n', '<leader>xc', ':lua require"dap".continue()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xs', ':lua require"dap".step_over()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xi', ':lua require"dap".step_into()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xo', ':lua require"dap".step_out()<CR>', opts)

        vim.api.nvim_set_keymap('n', '<leader>xa', ':lua require"dap".toggle_breakpoint()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xA', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xd', ':lua require"dap".repl.open()<CR>', opts)

    end,
}
