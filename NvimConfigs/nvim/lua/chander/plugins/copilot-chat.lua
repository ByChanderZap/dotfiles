local prompts = {
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	JsDocs = "Please provide JsDocs for the following code.",
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.",
	CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
			prompts = prompts,
			system_prompt = "You are a senior software engineer, mainly focused on backend development. You are expert in Javascript, Typescript and Go, but also have knowledge of Python.\nYou are not afraid to ask questions if the provided information is not enough to give a good answer.\nYou always try to provide the most acurate answer possible, always with a extreme clear explanation and a useful example.\nYou also have experience as a software architect, an expert of design patterns, best practices, clean code, hexagonal architecture, DDD, microservices, clean architecture and cloud native development.\nYou also have experience as a DevOps engineer, with knowledge of CI/CD pipelines, infrastructure as code, monitoring, logging and cloud providers like AWS, GCP and Azure.\nYou also have experience as a tech lead, with knowledge of agile methodologies, team management, code reviews and mentoring.",
			language = "English",
			bind_to_copilot = true,
			chat = { welcome_message = "Hello! How can I assist you today? " },
			models = {
				chat = {
					model = "gpt-4.1",
					-- model = "gpt-3.5-turbo"
					-- model = "gpt-3.5-turbo-16k"
					-- model = "gpt-4o"
					-- other model options can be found running :CopilotChatModels
				},
			},
			mappings = {
				complete = {
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				reset = {
					normal = "<C-l>",
					insert = "<C-l>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				toggle_sticky = {
					normal = "grr",
				},
				clear_stickies = {
					normal = "grx",
				},
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				jump_to_diff = {
					normal = "gj",
				},
				quickfix_answers = {
					normal = "gqa",
				},
				quickfix_diffs = {
					normal = "gqd",
				},
				yank_diff = {
					normal = "gy",
					register = '"', -- Default register to use for yanking
				},
				show_diff = {
					normal = "gd",
					full_diff = false, -- Show full diff instead of unified diff when showing diff window
				},
				show_info = {
					normal = "gi",
				},
				show_context = {
					normal = "gc",
				},
				show_help = {
					normal = "gh",
				},
			},
			temperature = 0.1,
			auto_insert_mode = true,
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatPrompt<CR>", mode = "n", desc = "Chat with Copilot Using Prompts" },
			{
				"<leader>cc",
				[[:<C-u>CopilotChatPrompt<CR>]],
				mode = "v",
				desc = "Chat with Copilot Using Prompts (visual)",
			},
			{ "<leader>cr", "<cmd>CopilotChat<CR>", mode = "n", desc = "Open chat" },
			{ "<leader>ch", "<cmd>CopilotChatHistory<CR>", mode = "n", desc = "Chat History" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
			{ "<leader>cf", "<cmd>CopilotChatFixIt<CR>", mode = "v", desc = "Fix Code" },
			{ "<leader>cg", "<cmd>CopilotChatGrammar<CR>", mode = "v", desc = "Check Grammar" },
			{ "<leader>cs", "<cmd>CopilotChatSummarize<CR>", mode = "v", desc = "Summarize Code" },
			{ "<leader>cm", "<cmd>CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
			{
				"<leader>cmv",
				"<cmd>CopilotChatCommit<CR>",
				mode = "v",
				desc = "Generate Commit Message for Selection",
			},
			{ "<leader>cx", "<cmd>CopilotChatReset<CR>", mode = "n", desc = "Reset Chat" },
			{ "<leader>cq", "<cmd>CopilotChatClose<CR>", mode = "n", desc = "Close Chat" },
			{ "<leader>cd", "<cmd>CopilotChatDocument<CR>", mode = "v", desc = "Document Code" },
		},
	},
}
