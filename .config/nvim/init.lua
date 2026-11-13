local indent_level = 4

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.number = true
vim.o.relativenumber = true

vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"

vim.o.wrap = true
vim.o.linebreak = true

vim.o.swapfile = false
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = 'split'

vim.o.scrolloff = 10

vim.o.winborder = 'double'
vim.o.signcolumn = 'yes'

vim.o.expandtab = true
vim.o.shiftwidth = indent_level
vim.o.tabstop = indent_level
vim.o.softtabstop = indent_level

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>Q', ':quit!<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', '<Esc>', '<C-Esc>')

vim.pack.add({
    {src = 'https://github.com/folke/tokyonight.nvim'},
    {src = 'https://github.com/navarasu/onedark.nvim'},
    {src = 'https://github.com/echasnovski/mini.pick'},
    {src = 'https://github.com/stevearc/oil.nvim'},
    {src = 'https://github.com/blazkowolf/gruber-darker.nvim'},
    {src = 'https://github.com/scottmckendry/cyberdream.nvim.git'},
    {src = 'https://github.com/m4xshen/autoclose.nvim'},
})

require 'autoclose'.setup()

require 'mini.pick'.setup()
require 'oil'.setup({
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["<c-h>"] = {
            "actions.toggle_hidden",
            mode = 'n',
        },
        ['<leader>:'] = {
            'actions.open_cmdline',
            opts = {
                shorten_path = true,
                modify = ':h',
            },
        },
    }
})

vim.keymap.set('n', '<leader>f', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>h', MiniPick.builtin.help)
vim.keymap.set('n', '<leader>t', MiniPick.builtin.buffers)
vim.keymap.set('n', '<leader>p', require('oil').open)
-- vim.keymap.set('n', '<c-h>', require('oil').toggle_hidden)

vim.keymap.set('n', '<a-Up>', '<c-w><Up>')
vim.keymap.set('n', '<a-Right>', '<c-w><Right>')
vim.keymap.set('n', '<a-Left>', '<c-w><Left>')
vim.keymap.set('n', '<a-Down>', '<c-w><Down>')

vim.keymap.set('n', '<a-h>', '<c-w>s')
vim.keymap.set('n', '<a-v>', '<c-w>v')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>y', '"+y')

vim.keymap.set('v', "<leader>'", "c''<Esc>P")
vim.keymap.set('v', "<leader>\"", "c\"\"<Esc>P")

vim.filetype.add({
    extension = {
        hs = "haskell",
        ebnf = "ebnf",
        spice = "spice",
    }
})

vim.lsp.config.lua_ls = {
    cmd = {"lua-language-server"},
    filetypes = {"lua"},

    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    },
}
vim.lsp.config.rust_analyzer = {
    cmd = {"rust-analyzer"},
    filetypes = {"rust"}
}
vim.lsp.config.tinymist = {
    cmd = {"tinymist"},
    filetypes = {"typst"},
}

vim.lsp.enable({"lua_ls", "rust_analyzer", "tinymist"})

vim.treesitter.language.add('odin')
vim.treesitter.language.add('haskell')
vim.treesitter.language.add('ebnf')
vim.treesitter.language.add('spice')
vim.treesitter.language.register('haskell', 'haskell')
vim.treesitter.language.register('odin', 'odin')
vim.treesitter.language.register('ebnf', 'ebnf')
vim.treesitter.language.register('spice', 'spice')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'odin' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'haskell' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ebnf' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'spice' },
  callback = function() vim.treesitter.start() end,
})

-- vim.api.nvim_set_hl(0, '@string.special.grammar', { link = '@string.regex' })
-- vim.api.nvim_set_hl(0, '@symbol.grammar.pascal', { link = '@type' })
-- vim.api.nvim_set_hl(0, '@symbol.grammar.camel', { link = '@property' })
-- vim.api.nvim_set_hl(0, '@symbol.grammar.upper', { link = '@constant' })
-- vim.api.nvim_set_hl(0, '@symbol.grammar.lower', { link = '@parameter' })

require 'onedark'.setup({
    style = 'warmer',
    term_colors = true,
    transparent = false,
    code_style = {
        keywords = 'bold',
    }
})

require 'gruber-darker'.setup({bold = true})
require 'cyberdream'.setup({
    italic_comments = true,
})

vim.cmd.colorscheme('onedark')
