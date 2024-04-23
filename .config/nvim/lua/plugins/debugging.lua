return {
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		ft = "python",
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			if string.find(vim.loop.os_uname().sysname, "Windows") then
				path = [[C:\Program Files\Python312\python.exe]]
			end
			require("dap-python").setup(path)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{

		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			-- Setting keymaps
			vim.keymap.set("n", "<leader>du", function()
				require("dapui").toggle({})
			end, { desc = "DBG: Toggle UI" })

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "DBG: Start/Continue" })
			vim.keymap.set("n", "<F6>", function()
				dap.step_over()
			end, { desc = "DBG: Step Over" })
			vim.keymap.set("n", "<F7>", function()
				dap.step_into()
			end, { desc = "DBG: Step Into" })
			vim.keymap.set("n", "<F8>", function()
				dap.step_out()
			end, { desc = "DBG: Step Out" })
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "DBG: Toggle Breakping" })
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "DBG: Open REPL" })
			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "DBG: Run-Last" })
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "DBG: Evaluate expression & float result" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "DBG: Evaluate expression & preview result" })

			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "DBG: Float current frames(centered)" })

			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "DBG: Float current scopes(centered)" })
		end,
	},
}
