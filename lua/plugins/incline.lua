return {
	'b0o/incline.nvim',
	ft = "arduino",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
	},
	config = function()
		local helpers = require 'incline.helpers'
		local navic = require 'nvim-navic'
		local devicons = require 'nvim-web-devicons'
		require('incline').setup {
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
				if filename == '' then
					filename = '[No Name]'
				end

				local function arduino_status()
					if vim.bo.filetype ~= "arduino" then
						return ""
					end
					local port = vim.fn["arduino#GetPort"]()
					local line = string.format("%s", vim.g.arduino_board)
					if vim.g.arduino_programmer ~= "" then
						line = line .. string.format(" [%s]", vim.g.arduino_programmer)
					end
					if port ~= 0 then
						line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
					end
					return line
				end

				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified
				local res = {
					--guibg = '#44406e',
					{ arduino_status(), gui = 'italic', guifg = ft_color, },
				}
				if props.focused then
					for _, item in ipairs(navic.get_data(props.buf) or {}) do
						table.insert(res, {
							{ ' > ',     group = 'NavicSeparator' },
							{ item.icon, group = 'NavicIcons' .. item.type },
							{ item.name, group = 'NavicText' },
						})
					end
				end
				table.insert(res, ' ')
				return res
			end,
		}
	end,
	-- Optional: Lazy load Incline
}
