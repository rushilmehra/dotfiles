require('nvim-treesitter.configs').setup {
  ensure_installed = { "python", "lua", "rust", "c", "go", "cpp" },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  index = {
    enable = false,
  }
}
