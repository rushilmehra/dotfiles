vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! normal! g`"zv'
})

vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost'}, {
  desc = 'Auto save all buffers when focus is lost',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! wall'
})
