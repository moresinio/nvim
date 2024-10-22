return {
	'willothy/nvim-cokeline',
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",      -- Required for v0.4.0+
		"kyazdani42/nvim-web-devicons", -- If you want devicons
	},
	keys = {
	},
	config = function()
		local map = vim.api.nvim_set_keymap
		local get_hl_attr = require("cokeline.hlgroups").get_hl_attr
		-- local bg_color = get_hl_attr('Comment', 'fg')
		local bg_color_active = get_hl_attr('CursorLine', 'bg')
		local fg_color_active = get_hl_attr('Title', 'fg')
		local bg_color_inactive = get_hl_attr('Normal', 'bg')
		local bg_color = get_hl_attr('Normal', 'bg')
		local error_color = get_hl_attr('DiagnosticError', 'fg')
		local ok_color = get_hl_attr('DiagnosticOk', 'fg')

		require('cokeline').setup({
			show_if_buffers_are_at_least = 1,
			mappings = {
				cycle_prev_next = true,
				map('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = false }),
				map('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = false }),
				map('n', '<F1>', '<Plug>(cokeline-switch-prev)', { silent = true }),
				map('n', '<F2>', '<Plug>(cokeline-switch-next)', { silent = true }),
			},

			---@type table | false
			sidebar = {
				---@type string | string[]
				filetype = { "NvimTree", "nnn", "neo-tree", },
				---@type Component[]
				components = {
					{
						text =
								function(buf)
									return buf.filetype
								end,
						fg =
								function(buffer)
									return fg_color_active
								end
					},

				},
			},

			default_hl = {
				bg = function(buffer)
					if buffer.is_focused then
						return bg_color_active
					end
				end,
			},
			-- The highlight group used to fill the tabline space
			fill_hl = "Normal",

			rhs = {
				{
					text = "", --   
					fg = bg_color_active,
				},
				{
					text = "󱃢 ", --'󰎦 󰬺 󰎤 󰲠 󰲡 ',
					fg = fg_color_active,
					bg = bg_color_active,
				},
			},

			tabs = {
				placement = "right", --'left" | "right",
				components = {
					{
						text = function(tabpage)
							return '[' .. tabpage.number .. '] |'
						end,
						fg =
								function(tabpage)
									if tabpage.is_active then
										return fg_color_active
									end
								end,
						bg = function(tabpage)
							if tabpage.is_active then
								return bg_color_active
							end
						end,
					},
					--	{
					--		text = "/",
					--		fg = bg_color_active,
					--	},
				}
			},

			components = {
				{
					text = function(buffer)
						local _text = ''
						-- if buffer.index > 1 then _text = ' ' end
						if buffer.is_focused then
							if buffer.is_first then
								_text = _text .. ''
							else
								_text = _text .. '' --   
							end
						end
						return _text
					end,
					fg = function(buffer)
						if buffer.is_focused then
							return bg_color_active
						elseif buffer.is_first then
							return bg_color_inactive
						end
					end,
					bg = function(buffer)
						if buffer.is_focused then
							if buffer.is_first then
								return bg_color_inactive
							else
								return 'none' --bg_color
							end
						elseif buffer.is_first then
							return bg_color_inactive
						end
					end
				},
				--index
				--{
				--	text = function(buffer) return buffer.index .. ' ' end,
				--	style = 'italic',
				--},
				{
					text = function(buffer)
						local status = ''
						if buffer.is_readonly then
							status = ''
						end
						return status
					end,
				},
				{
					text = function(buffer)
						return " " .. buffer.devicon.icon
					end,
					fg = function(buffer)
						if buffer.is_focused then
							return buffer.devicon.color
						end
					end
				},
				{
					text = function(buffer)
						return buffer.unique_prefix .. buffer.filename
					end,
					fg = function(buffer)
						if (buffer.diagnostics.errors > 0) then
							return error_color
						elseif buffer.is_modified then
							return ok_color
						else
							return fg_color_active
						end
					end,
					bold = function(buffer)
						if buffer.is_focused then
							return true
						end
					end,
					underline = function(buffer)
						if buffer.is_focused or buffer.is_hovered then
							return true
						end
					end,
				},
				{
					---@param buffer Buffer
					text = function(buffer)
						if buffer.is_modified then
							if buffer.is_hovered then
								return " 󰅙"
							end
							--		if (buffer.diagnostics.errors > 0) then
							--			return " 󰈸"
							--		end
							return " 󰌪"
						end
						if buffer.is_hovered then
							return " 󰅙" --󰅙 󰅚 󰲡 󱤆 󱤅 󰌪 󰲠 󰪥  󰝥  󰧞 󰧟󰗖  󱠇
						end
						return " 󰅚" --  󰅖
					end,
					fg = function(buffer)
						if buffer.is_modified then
							--	if (buffer.diagnostics.errors > 0) then
							--		return error_color
							--	end
							return ok_color
						end
						--	if (buffer.diagnostics.errors > 0) then
						--		return error_color
						--	end
						return fg_color_active
					end,
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end,
				},
				{
					text = function(buffer)
						if buffer.is_focused or buffer.is_last then
							return '' --  
						else
							return ' '
						end
					end,
					fg = function(buffer)
						if buffer.is_focused then
							return bg_color_active
						elseif buffer.is_last then
							return bg_color_inactive
						else
							return bg_color_inactive
						end
					end,
					bg = function(buffer)
						if buffer.is_focused then
							if buffer.is_last then
								return bg_color
							else
								return bg_color_inactive
							end
						elseif buffer.is_last then
							return bg_color_inactive
						end
					end
				}
			},
		})
	end,
}
