return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.move").setup()
		require("mini.files").setup()
		require("mini.surround").setup()
	end,
}
