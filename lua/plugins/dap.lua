return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
	},
	config = function()
		local dap = require('dap')
		local icons = require("plugins.Ui.icons")
		-- dap.adapters.lldb = {
		-- 	type = 'executable',
		-- 	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
		-- 	name = 'lldb'
		-- }
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = 'executable',
			command = "/home/rengoku/.local/share/nvim/mason/bin/OpenDebugAD7",
		}

		-- SIGNS	
		vim.fn.sign_define('DapBreakpoint',
			{ text = icons.dap.Breakpoint, texthl = 'DapUIBreakpointsInfo', linehl = '', numhl = '' })
		vim.fn.sign_define('DapUIBreakpointCondition',
			{ text = icons.dap.BreakpointCondition, texthl = 'DapUIBreakpointsInfo', linehl = '', numhl = '' })
		vim.fn.sign_define('DapLogPoint',
			{ text = icons.dap.LogPoint, texthl = 'DapUIBreakpointsInfo', linehl = '', numhl = '' })
		vim.fn.sign_define('DapStopped',
			{ text = icons.dap.Stopped, texthl = 'DapUIStoppedThread', linehl = '', numhl = '' })

		dap.defaults.fallback.external_terminal = {
			command = '/usr/bin/foot',
			args = { '-e' },
		}

		dap.defaults.fallback.force_external_terminal = false

		dap.configurations.cpp = {
			{
				-- name = 'Launch',
				-- type = 'lldb',
				-- request = 'launch',
				-- program = function()
				-- 	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				-- end,
				-- cwd = '${workspaceFolder}',
				-- stopOnEntry = false,
				-- args = {},
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,

				-- 💀
				-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
				--
				--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				--
				-- Otherwise you might get the following error:
				--
				--    Error on launch: Failed to attach to the target process
				--
				-- But you should be aware of the implications:
				-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
				--runInTerminal = true,
			},
			{
				name                    = "Attach to gdbserver :1234",
				type                    = "cppdbg",
				request                 = "launch",
				MIMode                  = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath          = "/usr/bin/gdb",
				cwd                     = '${workspaceFolder}',
				program                 = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,

			}
		}
	end
}
