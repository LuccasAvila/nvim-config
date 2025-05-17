return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    opts = {
      max_lines = 1,
    },
    config = function(_, opts)
      require 'treesitter-context'.setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    opts = {
      auto_install = true,
      ensure_installed = "all",
      indent = { enable = true },
      highlight = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.filetype.add({ extension = { mdx = 'mdx' } })
      vim.treesitter.language.register("markdown", "mdx")
    end
  },
}
