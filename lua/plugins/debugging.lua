return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "ldelossa/nvim-dap-projects",
      config = function()
        require("mason").setup()
        require("nvim-dap-projects").setup()
        local dap = require("dap")
        dap.setup()
      end,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-nvim-dap").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require("mason").setup()
      require("dapui").setup()
      require("mason-nvim-dap").setup()
      local dap, dapui = require("dap"), require("dapui")
      require("nvim-dap-projects").search_project_config()
      -- Configuration for C/C++/Rust/Python
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-vscode",
        name = "lldb",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          console = "integratedConsole",
          runInTerminal = false,
          program = function()
            -- Extract the file name from the current buffer
            local current_file = vim.fn.expand("%:p")
            -- Extract the file name without extension
            local file_name = vim.fn.expand("%:t:r")
            -- Extract the directory of the file
            local file_dir = vim.fn.expand("%:p:h")

            -- Compile the file using g++
            -- You can adjust the compilation command based on your needs
            local compile_command = "g++ -std=c++11 -g -o "
                .. file_dir
                .. "/"
                .. file_name
                .. " "
                .. current_file
            os.execute(compile_command)

            -- Return the path to the compiled executable
            return file_dir .. "/" .. file_name
          end,
          cwd = "${workspaceFolder}",
          -- stopOnEntry = true,
          args = {},
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
      -- Python
      dap.adapters.python = function(cb, config)
        if config.request == "attach" then
          ---@diagnostic disable-next-line: undefined-field
          local port = (config.connect or config).port
          ---@diagnostic disable-next-line: undefined-field
          local host = (config.connect or config).host or "127.0.0.1"
          cb({
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = {
              source_filetype = "python",
            },
          })
        else
          cb({
            type = "executable",
            command = "/Users/eyalyemini/.virtualenvs/debugpy/bin/python",
            args = { "-m", "debugpy.adapter" },
            options = {
              source_filetype = "python",
            },
          })
        end
      end
      dap.configurations.python = {
        {
          -- The first three options are required by nvim-dap
          type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = "launch",
          console = "integratedTerminal",
          name = "Launch file",
          program = "${file}", -- This configuration will launch the current file if used.
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            else
              return "python3"
            end
          end,
        },
      }
      -- UI configuration
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      -- Keybindings
      vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
      vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
      vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
      vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
    end,
  },
}
