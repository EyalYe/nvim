-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

vim.cmd("set clipboard=unnamedplus")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")

-- Set Tab to switch between tabs
vim.cmd("nnoremap <Tab> :tabnext<CR>")
vim.cmd("nnoremap <S-Tab> :bnext<CR>")
-- Set C-s to open the diagnostic float window
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.opt.wrap = true
