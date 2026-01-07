return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",

      build = "make",

      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim"
    },
    {
      "nvim-tree/nvim-web-devicons", 
      enabled = vim.g.have_nerd_font
    },
  },

  config = function()
    require("telescope").setup({})

 
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select") 

    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set("n", "<leader>sh", builtin.help_tags, {desc = "[S]earch [H]elp menu"})
    keymap.set("n", "<leader>sk", builtin.keymaps, {desc = "[S]earch [K]eymaps"})
    keymap.set("n", "<leader>sf", builtin.find_files, {desc = "[S]earch [F]iles"})
    keymap.set("n", "<leader>ss", builtin.builtin, {desc = "[S]earch [S]elect Telescope"})
    keymap.set("n", "<leader>sw", builtin.grep_string, {desc = "[S]earch current [W]ord"})
    keymap.set("n", "<leader>sg", builtin.live_grep, {desc = "[S]earch by [G]rep"})
    keymap.set("n", "<leader>sd", builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})
    keymap.set("n", "<leader>sr", builtin.resume, {desc = "[S]earch [R]esume"})
    keymap.set("n", "<leader>s.", builtin.oldfiles, {desc = "[S]earch Recent Files (\".\" for repeat)"})
    keymap.set("n", "<leader>sb", builtin.buffers, {desc = "[S]earch [B]uffers"})

    keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, {desc = "[/] fuzzily search in current buffer"})

    keymap.set("n", "<leader>sn", function()
      builtin.find_files {cwd = vim.fn.stdpath "config"}
    end, {desc = "[S]earch [N]eovim files"})
   end,
}
