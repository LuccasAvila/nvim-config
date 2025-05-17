local servers = { 'cssls', 'tailwindcss', 'eslint', 'lua_ls', 'elixirls', 'nixd',
  'rust_analyzer', 'intelephense', 'astro', 'ruby_lsp', 'volar', 'ts_ls', 'gopls', 'zls' }

return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    },
    opts = {
      inlay_hints = { enabled = true },
      diagnosticts = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    config = function()
      require("neoconf").setup({})

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require("plugins.lsp.keymaps").on_attach

      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup { on_attach = on_attach, capabilities = capabilities }
      end

      require('lspconfig').tailwindcss.setup {
        init_options = {
          userLanguages = { elixir = 'html-eex', eelixir = 'html-eex', heex = 'html-eex' },
        },
      }
    end,
  },
}
