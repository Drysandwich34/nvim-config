return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "clangd",
          "html",
          "cssls",
          "jsonls",
        },
        automatic_installation = true,
      })
      -- After Mason ensures servers are installed, configure LSP
      require("config.lsp").setup_servers()
    end,
  },

  -- Still include nvim-lspconfig: it's needed for the server-specific config data
  {
    "neovim/nvim-lspconfig",
  },
}

