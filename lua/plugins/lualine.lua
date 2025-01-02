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
	event = "BufAdd",
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = "auto", --'pywal',
				component_separators = "󰨐", --'󰨐•', ◈ { left = '', right = '' }, --'•',
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = { "snacks_dashboard", "lazy", "packer", "alpha" },
					winbar = { "snacks_dashboard", "toggleterm", "SymbolsSidebar", "lazy", "alpha", "nnn", "neo-tree", "dap-repl" } },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ function() return icons.emojis.a end, separator = { right = 'nil' } },
					{
						function() -- mode view
							local mode_name_upper = require("lualine.utils.mode").get_mode()
							local mode_name_lower = mode_name_upper:lower()
							local mode_icon_raw = mode_icon_map[mode_name_upper]
							local mode_icon_safety = mode_icon_raw == nil and "" or mode_icon_raw

							--return mode_icon_safety .. " " .. mode_name_lower
							return mode_name_lower
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
					{
						'searchcount',
						color = { gui = "italic" },
					},
					{
						function()
							local buf_clients = vim.lsp.get_clients { bufnr = 0 }
							if #buf_clients == 0 then
								return ""
							end

							local buf_client_names = {}

							-- add client
							for _, client in pairs(buf_clients) do
								if client.name ~= "null-ls" and client.name ~= "copilot" then
									table.insert(buf_client_names, client.name)
								end
							end

							local unique_client_names = table.concat(buf_client_names, ", ")
							--local language_servers = string.format("[%s]", unique_client_names)

							return unique_client_names
						end,
						--color = { guifg = "WinSeparator", gui = "italic" },
						color = { gui = "italic" },
					},
					{
						'encoding',
						color = { gui = "italic" },
					},
					{
						"filetype",
						colored = false,
						color = { gui = "italic" },
					}
				},
				lualine_y = {
					{
						"%v" .. "|" .. "%L"
					},
				},
				lualine_z = {
					{
						progress_cyrcle,
						separator = "",
						--padding = { left = 1, right = 1 },
					},
				},
			},

			winbar = {
				lualine_c = {
					{ function() return "󱨊" end, -- icons.ui.CircleSmall end,
						--separator = { right = ' ' },
						color = "Question",
					},
					{
						'filename',
						newfile_status = false, -- Display new file status (new file means no write after created)
						file_status = false, -- Displays file status (readonly status, modified status)
						shorting_target = 20,
						path = 3,
						color = "Comment",
					}
				},
			},
			inactive_winbar = {
				lualine_c = {
					{ function() return "󱨊" end, --icons.ui.CircleSmall end,
						--separator = { right = ' ' },
						color = { bg = "Comment", }
					},
					{
						'filename',
						file_status = false, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						shorting_target = 20,
						path = 3,
						color = "Comment",
					}
				},
			},
		}
	end,
}
