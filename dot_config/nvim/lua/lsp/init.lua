vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
  signs = { active = signs },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" }
})

local opts = { silent = true, noremap = true }

local on_attach = function(client, bufnr)
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")

  local function buf_set_keymap(key, cmd)
    vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, opts)
  end

  buf_set_keymap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
  buf_set_keymap("gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
  buf_set_keymap("gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  buf_set_keymap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_set_keymap("gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("[a", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_set_keymap("]a", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  buf_set_keymap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_set_keymap("<C-x><C-x>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  buf_set_keymap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {}
  }
}

require('lspconfig')['zls'].setup {
  on_attach = on_attach,
}

require('lspconfig')['lua_ls'].setup {
  on_attach = on_attach,
  flags = {},
  settings = {
    Lua = {
      format = {
        enable = false
      },
      workspace = {
        checkThirdParty = false,
      }
    }
  }
}

require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
}

-- require('lspconfig')['clangd'].setup{
--   on_attach = on_attach,
-- }
