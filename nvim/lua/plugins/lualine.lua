return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = { theme = "onedark" },
		sections = {
			lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
			lualine_y = {  "hostname", "progress" },
		},
	},
}
