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
-- Set C-s to open the diagnostic float window
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
