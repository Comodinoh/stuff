return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {style = "night"},
    init = function()
      vim.cmd.colorscheme "tokyonight"

      vim.cmd.hi "Comment gui=none"
    end,
  },

}

