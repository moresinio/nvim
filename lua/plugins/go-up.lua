return {
    'nullromo/go-up.nvim',
		event = "BufAdd",
    opts = {
    goUpLimit = 13,
		}, -- specify options here
    config = function(_, opts)
        local goUp = require('go-up')
        goUp.setup(opts)
    end,
}
