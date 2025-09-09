return {
	"zbirenbaum/copilot.lua",
	optional = true,
	opts = {
		suggestion = {
			enabled = true, -- enable ghost text
			auto_trigger = false, -- disable auto-trigger
			keymap = {
				accept = "<C-l>", -- accept suggestion
				next = "<M-]>", -- next suggestion
				prev = "<M-[>", -- previous suggestion
				dismiss = "<C-]>",
				accept_word = false,
				accept_line = false,
				trigger = "<C-.>", -- set manual trigger key
			},
		},
		panel = { enabled = true },
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
	},
}
