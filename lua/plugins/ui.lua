return {
	-- Override tokyonight to use day style (LazyVim default is "night")
	-- { "folke/tokyonight.nvim", opts = { style = "day" } },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavor = "latte" } },

	-- Disable snacks scroll animation
	{ "folke/snacks.nvim", opts = { scroll = { enabled = false } } },

	-- Rainbow delimiters for matching parentheses
	{
		"hiphish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy.global,
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
}
