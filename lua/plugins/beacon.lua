return {
	'danilamihailov/beacon.nvim',
	enabled = true,
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
  width = 40, --- integer width of the beacon window
  min_jump = 20, --- integer what is considered a jump. Number of lines
	}
}
