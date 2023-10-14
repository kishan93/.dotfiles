
vim.g.copilot_filetypes = {
  xml = false,
  markdown = false
}

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-t>", ":copilot#Accept,('\\<CR>')<CR>", { silent = true })

