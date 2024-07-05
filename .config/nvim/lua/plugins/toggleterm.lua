return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		direction = 'float',
		config = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float",
				hidden = true,
			})
			local function _lazygit_toggle()
				lazygit:toggle()
			end
			vim.keymap.set("n", "<leader>lg", _lazygit_toggle, { noremap = true, silent = true })
		end,
	}
}

