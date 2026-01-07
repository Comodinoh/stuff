local opt = vim.opt

vim.g.have_nerd_font = true

opt.relativenumber = true
opt.number = true
opt.cursorline = true

opt.smartindent = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

opt.wrap = false

opt.showmode = false

opt.scrolloff = 10

opt.updatetime = 250
opt.timeoutlen = 300

opt.undofile = true

opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = false

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("Nvim-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	extension = {
		c3 = "c3",
		c3i = "c3",
		c3t = "c3",
	},
})
