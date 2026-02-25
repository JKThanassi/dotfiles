return {
	-- Tagbar: code outline viewer
	{
		"majutsushi/tagbar",
		cmd = "TagbarToggle",
		config = function()
			vim.g.tagbar_type_haskell = {
				ctagsbin = "hasktags",
				ctagsargs = "-x -c -o-",
				kinds = {
					"m:modules:0:1",
					"d:data:0:1",
					"d_gadt:data gadt:0:1",
					"nt:newtype:0:1",
					"c:classes:0:1",
					"i:instances:0:1",
					"cons:constructors:0:1",
					"c_gadt:constructor gadt:0:1",
					"c_a:constructor accessors:1:1",
					"t:type names:0:1",
					"pt:pattern types:0:1",
					"pi:pattern implementations:0:1",
					"ft:function types:0:1",
					"fi:function implementations:0:1",
					"o:others:0:1",
				},
				sro = ".",
				kind2scope = {
					m = "module",
					d = "data",
					d_gadt = "d_gadt",
					c_gadt = "c_gadt",
					nt = "newtype",
					cons = "cons",
					c_a = "accessor",
					c = "class",
					i = "instance",
				},
				scope2kind = {
					module = "m",
					data = "d",
					newtype = "nt",
					cons = "c_a",
					d_gadt = "c_gadt",
					class = "ft",
					instance = "ft",
				},
			}
		end,
	},

	-- tslime: send commands to tmux pane
	{
		"sjl/tslime.vim",
		keys = {
			{ "<leader>t", mode = { "n", "v" }, desc = "Send to tmux" },
			{ "<leader>T", mode = "n", desc = "Set tmux variables" },
		},
		config = function()
			vim.g.tslime_ensure_trailing_newlines = 1
			vim.g.tslime_normal_mapping = "<leader>t"
			vim.g.tslime_visual_mapping = "<leader>t"
			vim.g.tslime_vars_mapping = "<leader>T"
		end,
	},

	-- DoxygenToolkit: documentation generation
	{
		"vim-scripts/DoxygenToolkit.vim",
		cmd = { "Dox", "DoxAuthor", "DoxBlock" },
	},

	-- Fugitive: git integration
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gwrite", "Gread", "Gdiff", "Gblame" },
	},

	-- octo: github integration
	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		opts = {
			-- or "fzf-lua" or "snacks" or "default"
			picker = "telescope",
			-- bare Octo command opens picker of commands
			enable_builtin = true,
		},
		keys = {
			{
				"<leader>oi",
				"<CMD>Octo issue list<CR>",
				desc = "List GitHub Issues",
			},
			{
				"<leader>op",
				"<CMD>Octo pr list<CR>",
				desc = "List GitHub PullRequests",
			},
			{
				"<leader>od",
				"<CMD>Octo discussion list<CR>",
				desc = "List GitHub Discussions",
			},
			{
				"<leader>on",
				"<CMD>Octo notification list<CR>",
				desc = "List GitHub Notifications",
			},
			{
				"<leader>os",
				function()
					require("octo.utils").create_base_search_command({ include_current_repo = true })
				end,
				desc = "Search GitHub",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR "ibhagwan/fzf-lua",
			-- OR "folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
