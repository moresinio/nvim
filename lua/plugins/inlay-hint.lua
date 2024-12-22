return {
	'felpafel/inlay-hint.nvim',
	enabled = false,
	event = 'LspAttach',
	config = function()
		require('inlay-hint').setup()
	end
}
