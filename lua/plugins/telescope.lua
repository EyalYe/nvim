
  return { 
    {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' } ,
    config = function()
      require('telescope').setup{
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" }
        }
      }
      -- Telescope
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')
      local previewers = require('telescope.previewers')
      local sorters = require('telescope.sorters')
      local themes = require('telescope.themes')
      -- remaps for telescope
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        -- This is your opts table
        require("telescope").setup ({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
            }
          }
        })
        require("telescope").load_extension("ui-select")
      end
    }, 
  }

