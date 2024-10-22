return {

	'goolord/alpha-nvim',
	event = "VimEnter",
	config = function()
		---@diagnostic disable: trailing-space, undefined-global
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow

		-- print("dashboard.setup()")

		-- Set header
		dashboard.section.header.val = {

			[[					 .                 .    ` *|  || :       `    | | :| | :      |:| |  ]],
			[[	 .                .          .        || |.: *          | || : :     :|||    ]],
			[[					.            .   . *    .   .  ` |||.  +        + '| |||  .  ||`     ]],
			[[			 .             *              .     +:`|!             . ||||  :.||`      ]],
			[[	 +                      .                ..!|*          . | :`||+ |||`       ]],
			[[			 .                         +      : |||`        .| :| | | |.| ||`     .  ]],
			[[				 *     +   '               +  :|| |`     :.+. || || | |:`|| `          ]],
			[[															.      .||` .    ..|| | |: '` `| | |`  +         ]],
			[[		.       +++                      ||        !|!: `       :| |               ]],
			[[								+         .      .    | .      `|||.:      .||    .      .    `]],
			[[						'                           `|.   .  `:|||   + ||'     `           ]],
			[[		__    +      *                         `'       `'|.    `:                 ]],
			[[	"'  `---"""----....____,..^---`^``----.,.___          `.    `.  .    ____,.,-]],
			[[			___,--'""`---"'   ^  ^ ^        ^       """'---,..___ __,..---""'        ]],
			[[	--"'                           ^         What about codewars..? __ . . __.  ]],
			[[ ]],
		}

		math.randomseed(os.time())

		local function pick_color()
			local colors = { "String", "Identifier", "Keyword", "Number" }
			return colors[math.random(#colors)]
		end


		local function footer()
			--	local plugins = #vim.tbl_keys(packer_plugins)
			local datetime = os.date "%H:%M"
			local plugins_text = " 󰄛  "
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
					.. "  󰄛 "
					.. datetime

			-- Quote
			local fortune = require("alpha.fortune")
			local quote = table.concat(fortune(), "\n")
			return plugins_text .. "\n" .. quote
		end
		--dashboard.section.footer.val = footer()

		--  Set menu
		dashboard.section.buttons.val = {
			dashboard.button("r", "  󰁔 Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("R", "  󰁔 Restore Session", ":SessionLoadLast<CR>"),
			dashboard.button("l", "  󰁔 Lazy update", ":Lazy update<CR>"),
			-- dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			-- dashboard.button("f", "  > Browse Files", ":Telescope find_files<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "  󰁔 Quit NVIM", ":qa<CR>"),
		}
		--
		--dashboard.section.footer.opts.hl = "Type"       --"AlphaFooter"
		dashboard.section.header.opts.hl = pick_color() --AlphaHeader"
		dashboard.section.buttons.opts.hl = "MoreMsg"
		--
		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

		-- print("dashboard.setup() done")
		--
	end,
}
