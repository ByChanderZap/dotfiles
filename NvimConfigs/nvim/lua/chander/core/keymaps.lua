-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Ctrl + c to scape from other modes
vim.keymap.set({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
--keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
--keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- save files with C-s
-- Redefine Ctrl+s to save with the custom function
--vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })
-- Save with formatting (calls your custom SaveFile function)
keymap.set("n", "<C-s>", function()
	SaveFile()
end, {
	desc = "Save file (custom function)",
	noremap = true,
	silent = true,
})

keymap.set({ "n", "i", "v", "s" }, "<C-i>", function()
	vim.g.skip_formatting = true
	return "<esc>:w<cr>"
end, {
	desc = "Save file without formatting",
	expr = true,
	noremap = true,
	silent = true,
})

-- Custom save function
function SaveFile()
	-- Check if a buffer with a file is open
	if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
		vim.notify("No file to save", vim.log.levels.WARN)
		return
	end

	local filename = vim.fn.expand("%:t") -- Get only the filename
	local success, err = pcall(function()
		vim.cmd("silent! write") -- Try to save the file without showing the default message
	end)

	if success then
		vim.notify(filename .. " Saved!") -- Show only the custom message if successful
	else
		vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
	end
end

-- kill all buffers but current one
keymap.set(
	"n",
	"<leader>bk",
	'<Esc>:%bdelete|edit #|normal`"<Return>',
	{ desc = "Delete other buffers but the current one" }
)

keymap.set("n", "<leader>bf", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
