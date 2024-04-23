return -- lazy.nvim
{
	"folke/noice.nvim",
	event = "VeryLazy",
	-- opts = {
	-- 	-- add any options here
	-- },
	config = function()
		local config = require("noice")
		config.setup({
			presets = {
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			cmdline = { enabled = false },
			messages = { enabled = false },
			notify = { enabled = false },
			popupmenu = { enabled = false },
		})
	end,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
}
