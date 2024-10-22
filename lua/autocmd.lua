local exec = vim.api.nvim_exec -- execute Vimscript
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)



vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight copied text",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 666 })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Rid auto comment for new string",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Jump to the last place you’ve visited in a file before exiting",
	callback = function()
		local ignore_ft = { "neo-tree", "toggleterm", "lazy" }
		local ft = vim.bo.filetype
		if not vim.tbl_contains(ignore_ft, ft) then
			local mark = vim.api.nvim_buf_get_mark(0, '"')
			local lcount = vim.api.nvim_buf_line_count(0)
			if mark[1] > 0 and mark[1] <= lcount then
				pcall(vim.api.nvim_win_set_cursor, 0, mark)
			end
		end
	end,
})

-- Set default colorcolumn
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Set colorcolumn equals textwidth",
	callback = function(data)
		local tw = vim.bo[data.buf].textwidth
		vim.opt_local.colorcolumn = tostring(tw)
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Open :help with vertical split",
	pattern = { "*.txt" },
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Redraw buffer when associated file is changed",
	command = "checktime",
})

-- Autoenable when 'relativenumber' is set to true. Need to restart neovim
if vim.opt.relativenumber:get() then
	local group = vim.api.nvim_create_augroup("toggle_relnum", { clear = false })
	local function set_relnum_back(win)
		vim.api.nvim_create_autocmd("CmdlineLeave", {
			group = group,
			once = true,
			callback = function()
				vim.wo[win].relativenumber = true
			end,
		})
	end

	vim.api.nvim_create_autocmd("CmdlineEnter", {
		desc = "Disables `relativenumber` when entering command line mode and enables it again when leaving",
		group = group,
		callback = function()
			local win = vim.api.nvim_get_current_win()
			if vim.wo[win].relativenumber then
				vim.wo[win].relativenumber = false
				vim.cmd("redraw")
				set_relnum_back(win)
			end
		end,
	})
end

vim.api.nvim_create_autocmd("BufHidden", {
	desc = "Delete [No Name] buffers",
	callback = function(data)
		if data.file == "" and vim.bo[data.buf].buftype == "" and not vim.bo[data.buf].modified then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, data.buf, {})
			end)
		end
	end,
})

-- From LunarVim
vim.api.nvim_create_autocmd("FileType",
	{
		--group = "_buffer_mappings",
		pattern = {
			"qf",
			"help",
			"man",
			"floaterm",
			"lspinfo",
			"lsp-installer",
			"tsplayground",
		},
		callback = function()
			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
			vim.opt_local.buflisted = false
		end,
	}
)

vim.api.nvim_create_autocmd("FileType",
	{
		--group = "_filetype_settings",
		pattern = { "lua" },
		desc = "fix gf functionality inside .lua files",
		callback = function()
			---@diagnostic disable: assign-type-mismatch
			-- credit: https://github.com/sam4llis/nvim-lua-gf
			vim.opt_local.include = [[\v<((do|load)file|require|reload)[^''"]*[''"]\zs[^''"]+]]
			vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
			vim.opt_local.suffixesadd:prepend ".lua"
			vim.opt_local.suffixesadd:prepend "init.lua"

			for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
				vim.opt_local.path:append(path .. "/lua")
			end
		end,
	}
)
