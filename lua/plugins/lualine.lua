-- Lsp status take from Wansmer's config
local function lsp_list()
	local get_clients = vim.fn.has("nvim-0.10") == 1 and vim.lsp.get_clients or vim.lsp.get_active_clients
	local buf_clients = get_clients({ bufnr = 0 })
	local buf_client_names = {}

	for _, client in pairs(buf_clients) do
		table.insert(buf_client_names, client.name)
	end

	return table.concat(buf_client_names, ", ")
end

local lsp_status = function()
	local lsp = lsp_list()
	local prefix = (lsp == "" and "LSP Inactive" or "%#LSPStatusActive#%*")
	return vim.trim(vim.fn.join({ prefix, lsp }, " "))
end

local icons = require('plugins.Ui.icons')
local mode_icon_map = {
	["NORMAL"] = "󰰓",
	["O-PENDING"] = "",
	["VISUAL"] = "󰰫",
	["V-LINE"] = "󰰬",
	["V-BLOCK"] = "󰰪",
	["V-REPLACE"] = "󰬝",
	["SELECT"] = "󰰢",
	["S-LINE"] = "󰰣",
	["S-BLOCK"] = "󰰡",
	["INSERT"] = "󰰄",
	["COMMAND"] = "󰯲",
	["EX"] = "󰰱",
	["REPLACE"] = "󰰟",
	["MORE"] = "󰰐",
	["CONFIRM"] = "󰯳",
	["SHELL"] = "󰰡",
	["TERMINAL"] = "󰰤",
}
local progress_cyrcle = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	--local chars = {
	--	"▱▱▱▱▱▱▱▱",
	--	"▱▱▱▱▱▱▱▰",
	--	"▱▱▱▱▱▱▰▰",
	--	"▱▱▱▱▱▰▰▰",
	--	"▱▱▱▱▰▰▰▰",
	--	"▱▱▱▰▰▰▰▰",
	--	"▱▱▰▰▰▰▰▰",
	--	"▱▰▰▰▰▰▰▰",
	--	"▰▰▰▰▰▰▰▰",
	--}
	--local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local chars = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)

	return chars[index]
end

return {
	'nvim-lualine/lualine.nvim',
	event = "VimEnter",
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = "auto", --'pywal',
				component_separators = "󰨐", --'󰨐•', ◈ { left = '', right = '' }, --'•',
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = { "dashboard", "lazy", "packer", "alpha" },
					winbar = { "lazy", "alpha", "nnn", "neo-tree", "dap-repl" } },
				always_divide_middle = true,
				globalstatus = true,
			},
			--extensions = { 'lazy', 'mason', "man", "neo-tree", "nvim-tree", "nvim-dap-ui" },
			sections = {
				lualine_a = {
					{ function() return icons.emojis.a end, separator = { right = 'nil' } },
					{
						function() -- mode view
							local mode_name_upper = require("lualine.utils.mode").get_mode()
							--local mode_name_lower = mode_name_upper:lower()
							local mode_icon_raw = mode_icon_map[mode_name_upper]
							local mode_icon_safety = mode_icon_raw == nil and "" or mode_icon_raw

							return mode_icon_safety -- .. " " .. mode_name_lower
						end,
					}
				},
				lualine_b = {
					{ 'branch' },
					{
						'diagnostics',
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							hint = icons.diagnostics.Hint,
							info = icons.diagnostics.Info,
						},
						sections = { 'error', 'warn', 'info', 'hint' },
					},
				},
				lualine_c = {
				},
				lualine_x = {
					{ lsp_status
						}
				},
				lualine_y = {
					--{ 'selectioncount' },
					--{ 'location' },
					-- { 'progress',
					-- 	separator = "",
					-- },
					{
						"%L"
					},
					{ progress_cyrcle,
						separator = "",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					--{ function() return os.date("%R") end },
					--	require('tomato').message,
				},
			},

			winbar = {
				lualine_c = {
					{ function() return icons.ui.CircleSmall end,
						--separator = { right = ' ' },
						color = "Question",
					},
					{
						'filename',
						path = 3,
						color = "Comment",
					}
				},
			},
			inactive_winbar = {
				lualine_c = {
					{ function() return icons.ui.CircleSmall end,
						--separator = { right = ' ' },
						color = { bg = "Comment", }
					},
					{
						'filename',
						path = 3,
						color = "Comment",
					}
				},
			},
		}
	end,
}
