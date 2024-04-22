local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>FF', '<cmd>Telescope git_files<cr>', opts)
keymap('n', '<leader>rg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles cwd_only=True<cr>', opts)
keymap('n', '<leader>tr', '<cmd>Telescope resume<cr>', opts)
