return {
  {
    "savq/melange-nvim",
    config = function()
      vim.cmd.colorscheme("melange")
      local mel = require("melange/palettes/dark")

      vim.api.nvim_set_hl(0, "Normal", { fg = mel.a.fg, bg = "#1e1e1e" })
    end
  }
}
