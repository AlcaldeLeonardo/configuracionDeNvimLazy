-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.set")



require('lspconfig').eslint.setup {
  settings = {
    validate = "on",
    codeAction = {
      enable = true,
      mode = "all", -- Habilita todas las acciones de corrección
    },
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.cmd("EslintFixAll")
      end,
    })
  end,
}
