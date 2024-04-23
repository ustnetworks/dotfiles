return {

	"lewis6991/gitsigns.nvim",
	-- event = "BufEnter",
	config = function()
		local git = require("gitsigns")
		git.setup({
			signs = {
				-- add = { text = "┃" },
				-- change = { text = "┃" },
				-- delete = { text = "_" },
				-- topdelete = { text = "‾" },
				-- changedelete = { text = "~" },
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		})
	end,
}
