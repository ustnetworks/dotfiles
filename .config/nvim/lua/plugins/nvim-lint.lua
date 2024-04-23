return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			python = { "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				print(lint.try_lint())
			end,
		})

		vim.keymap.set("n", "<leader>gl", function()
			print("start linting")
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
