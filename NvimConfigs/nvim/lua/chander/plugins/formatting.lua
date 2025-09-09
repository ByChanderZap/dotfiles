return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
			go = { name = "gopls", timeout_ms = 500, lsp_format = "prefer" },
			javascript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			json = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			jsonc = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			less = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },
			scss = { "prettier" },
			sh = { "shfmt" },
			typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			yaml = { "prettier" },
			["_"] = { "trim_whitespace", "trim_newlines" },
		},
		format_on_save = function()
			if vim.g.minifiles_active then
				return nil
			end
			if vim.g.skip_formatting then
				vim.g.skip_formatting = false
				return nil
			end
			if not vim.g.autoformat then
				return nil
			end
			return {}
		end,
		formatters = {
			prettier = {
				require_cwd = true,
			},
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		vim.g.autoformat = true
	end,

	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
