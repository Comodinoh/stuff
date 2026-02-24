return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local map = function(keys, func)
			vim.keymap.set("n", keys, func)
		end

		local harpoon = require("harpoon")

		harpoon:setup()

		map("<leader>a", function()
			harpoon:list():add()
		end)

		map("<C-h>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		map("<C-[>", function()
			harpoon:list():prev()
		end)

		map("<C-]>", function()
			harpoon:list():next()
		end)

		map("<C-7>", function()
			harpoon:list():select(1)
		end)
		map("<C-8>", function()
			harpoon:list():select(2)
		end)
		map("<C-9>", function()
			harpoon:list():select(3)
		end)
		map("<C-0>", function()
			harpoon:list():select(4)
		end)
	end,
}
