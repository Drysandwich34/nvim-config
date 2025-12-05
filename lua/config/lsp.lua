local M = {}

function M.setup_servers()
  local mlsp = require("mason-lspconfig")
  local installed = mlsp.get_installed_servers()

  -- You can define on_attach behavior via LspAttach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, silent = true })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, silent = true })
    end,
  })

  -- Capabilities (e.g. for cmp)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- For every server Mason installed, configure it
  for _, server in ipairs(installed) do
    -- Use the native lsp.config API
    vim.lsp.config(server, {
      capabilities = capabilities,
      -- Optional: you can specify more per-server settings here
      -- settings = { ... },
    })
    -- Enable the LSP
    vim.lsp.enable({ server })
  end
end

return M

