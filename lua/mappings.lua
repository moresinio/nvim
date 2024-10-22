local map = vim.keymap.set

map("n", "<Leader>q", "<Cmd>qa<Cr>", { desc = "Close neovim" })
map("n", "<Leader>w", "<Cmd>w<Cr>", { desc = "Save file" })

map("n", "<M-h>", "<C-w>h", { desc = "Focus to left-side window" })
map("n", "<M-j>", "<C-w>j", { desc = "Focus to right-side window" })
map("n", "<M-k>", "<C-w>k", { desc = "Focus to top-side window" })
map("n", "<M-l>", "<C-w>l", { desc = "Focus to bottom-side window" })

map("n", "<leader>\\", "<c-w>v", { desc = "Split window right" })

map("n", "S", '"_S', { desc = "'S' without copying to clipboard" })
map("n", "C", '"_C', { desc = "'C' without copying to clipboard" })
map("n", "D", '"_D', { desc = "'D' without copying to clipboard" })

-- see "gbprod/yanky.nvim",
map({"n","x"}, "p", "<Plug>(YankyPutAfter)")
map({"n","x"}, "P", "<Plug>(YankyPutBefore)")
map({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
map({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

local wk = require("which-key")
wk.add({
	{ "<leader>b",  group = "Buffers" },
	{ "<leader>bb", "<cmd>Telescope buffers<cr>",                         desc = "Buffers" },

	{ "<leader>E",  group = "Explorer" },
	{ "<leader>Ef", "<cmd>Neotree float<cr>",                             desc = "Neotree float" },
	{ "<leader>Eb", "<cmd>Neotree bottom<cr>",                            desc = "Neotree bottom" },
	{ "<leader>Er", "<cmd>Neotree right<cr>",                             desc = "Neotree right" },
	{ "<leader>El", "<cmd>Neotree left<cr>",                              desc = "Neotree left" },

	{ "<leader>d",  group = "Debug" },
	{ "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>",          desc = "Run To Cursor" },
	{ "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
	{ "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",              desc = "Step Back" },
	{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",             desc = "Disconnect" },
	{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>",                desc = "Get Session" },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",              desc = "Step Into" },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",              desc = "Step Over" },
	{ "<leader>dp", "<cmd>lua require'dap'.pause()<cr>",                  desc = "Pause" },
	{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>",                  desc = "Quit" },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",            desc = "Toggle Repl" },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",               desc = "Start" },
	{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",      desc = "Toggle Breakpoint" },
	{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",               desc = "Step Out" },

	{ "<leader>;",  "<cmd>Alpha<CR>",                                     desc = "Dashboard" },
	{ "<leader>L",  "<cmd>Lazy<CR>",                                      desc = "Lazy" },
	{ "<leader>h",  "<cmd>nohlsearch<CR>",                                desc = "No Highlight" },

	{ "<leader>S",  group = "Session" },
	{ "<leader>Sl", "<cmd>SessionLoad<cr>",                               desc = "Session load" },
	{ "<leader>Ss", "<cmd>SessionSave<cr>",                               desc = "Session save" },

	{ "<leader>s",  group = "Search" },
	{ "<leader>sC", "<cmd>Telescope commands<cr>",                        desc = "Commands" },
	{ "<leader>sH", "<cmd>Telescope highlights<cr>",                      desc = "Find highlight groups" },
	{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                       desc = "Man Pages" },
	{ "<leader>sR", "<cmd>Telescope registers<cr>",                       desc = "Registers" },
	{ "<leader>sb", "<cmd>Telescope git_branches<cr>",                    desc = "Checkout branch" },
	{ "<leader>sc", "<cmd>Telescope colorscheme<cr>",                     desc = "Colorscheme" },
	{ "<leader>sf", "<cmd>Telescope find_files<cr>",                      desc = "Find File" },
	{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                       desc = "Find Help" },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>",                         desc = "Keymaps" },
	{ "<leader>sl", "<cmd>Telescope resume<cr>",                          desc = "Resume last search" },
	{ "<leader>se", "<cmd>Telescope noice<cr>",                           desc = "Errors via Noice" },
	{
		"<leader>sp",
		"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
		desc = "Colorscheme with Preview"
	},
	{ "<leader>sr", "<cmd>Telescope oldfiles<cr>",  desc = "Open Recent File" },
	{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
})
