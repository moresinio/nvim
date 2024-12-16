return {
	"folke/snacks.nvim",
	enent = "UiEnter",
	lazy = false,
	keys = {
		{ "<leader>m",  function() require("snacks").scratch() end,         desc = "Toggle Scratch Buffer" },
		{ "<F4>",       function() require("snacks").bufdelete() end,       desc = "Delete Buffer" },
		{ "<leader>bC", function() require("snacks").bufdelete.other() end, desc = "Delete all buffer except focused" },
		--{ "]]",         function() require("snacks").words.jump(vim.v.count1) end,  desc = "Next Reference",                  mode = { "n", "t" } },
		--{ "[[",         function() require("snacks").words.jump(-vim.v.count1) end, desc = "Prev Reference",                  mode = { "n", "t" } },
		{
			"<leader>tm",
			function()
				local enabled = require("snacks").dim.enabled
				require("snacks").dim[enabled and "disable" or "enable"]()
			end,
			desc = "󰝟 Mute code",
		},
	},
	opts = {
		dashboard = {
			enabled = true,
			width = 45,
			row = nil,                                                                -- dashboard position. nil for center
			col = nil,                                                                -- dashboard position. nil for center
			pane_gap = 0,                                                             -- empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
			-- These settings are used by some built-in sections
			preset = {
				keys = {
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				header = [[
.:::     .::.::::::::    .::::     .::         .::.::.::       .:: 
.: .::   .::.::        .::    .::   .::       .:: .::.: .::   .::: 
.:: .::  .::.::      .::        .::  .::     .::  .::.:: .:: . .:: 
.::  .:: .::.::::::  .::        .::   .::   .::   .::.::  .::  .:: 
.::   .: .::.::      .::        .::    .:: .::    .::.::   .:  .:: 
.::    .: ::.::        .::     .::      .::::     .::.::       .:: 
.::      .::.::::::::    .::::           .::      .::.::       .:: 
					]]                                                                 
			},
			formats = {
				key = function(item)
					return { { "▏", hl = "special" }, { item.key, hl = "key" }, { "▕", hl = "special" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys",   gap = 0, padding = 1 },
				{ section = "startup" },
			},
		},

		notifier = {
			enabled = true,
			timeout = 7500,
			sort = { "added" }, -- sort only by time
			width = { min = 12, max = 0.5 },
			height = { min = 1, max = 0.5 },
			icons = { error = "󰅚", warn = "", info = "󰋽", debug = "󰃤", trace = "󰓗" },
			top_down = true,
		},

		bigfile = { enabled = true },
		words = {
			enabled = false,
			jumplist = false,
		},
		dim = {
			enabled = true,
			scope = {
				min_size = 5,
				max_size = 20,
				siblings = true,
			},
		},

		input = { enabled = true },
	},
}
--                                 :                                        
--   L.                     ,;    t#,                                       
--   EW:        ,ft       f#i    ;##W.              t                       
--   E##;       t#E     .E#t    :#L:WE              Ej            ..       :
--   E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et
--   E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t
--   E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t
--   E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t
--   E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t
--   E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t
--   E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t
--   E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t
--   ..         G#E        tt      t     t          E#t ...      #G      .. 
--               fE                                 ,;.          j          
--                ,                                                         