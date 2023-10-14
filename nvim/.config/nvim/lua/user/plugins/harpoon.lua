local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file)
vim.keymap.set("n", "<leader>hk", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>ht", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hr", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>ha", function() ui.nav_file(4) end)




vim.g.copilot_filetypes = {
  xml = false,
  markdown = false
}

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-t>", ":copilot#Accept,('\\<CR>')<CR>", { silent = true })
