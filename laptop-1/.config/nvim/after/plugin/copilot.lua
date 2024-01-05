-- Copilot disable filetypes (.env)
vim.g.copilot_disable_filetypes = {'env'}

-- map key to disable copilot
vim.api.nvim_set_keymap('n', '<leader>cpd', ':CopilotDisable<CR>', {noremap = true, silent = true})
