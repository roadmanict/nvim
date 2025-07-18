vim.g.mapleader = " "

require("roadmanict")
require("plugins")

require("nvim-treesitter").setup({
	ensure_installed = { "typescript", "javascript", "rust", "java", "html" },
	auto_install = false,
	highlight = {
		enable = true,
	},
})

require("telescope").setup()
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Conform format file" })

require("blink.cmp").setup()

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = false,
})

vim.lsp.enable({ "lua_ls", "ts_ls", "angularls" })
