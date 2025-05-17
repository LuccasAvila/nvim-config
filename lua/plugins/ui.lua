return {
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },

      sections = {
        lualine_a = { { "mode" } },
        lualine_b = { { "branch", icon = "" }, { "diff" } },
        lualine_c = { { "diagnostics" }, { "filename", path = 1, } },
        lualine_y = { { "filetype", icons_enabled = false } },
        lualine_z = { { "location" } },
      },
    },
  },
}
