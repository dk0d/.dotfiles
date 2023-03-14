return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "jbyuki/one-small-step-for-vimkind",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      {
        "<leader>rj",
        ":DapLoadLaunchJSON<cr>",
        desc = "Load vscode launch.json",
      },

      {
        "<leader>rc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>rR",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>rb",
        function()
          require("dap").step_back()
        end,
        desc = "Step Back",
      },
      {
        "<leader>rd",
        function()
          require("dap").disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "<leader>rg",
        function()
          require("dap").session()
        end,
        desc = "Get Session",
      },
      {
        "<leader>ri",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>ro",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>rP",
        function()
          require("dap").pause.toggle()
        end,
        desc = "Pause",
      },
      {
        "<leader>rq",
        function()
          require("dap").close()
        end,
        desc = "Quit",
      },
      {
        "<leader>rr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>rs",
        function()
          require("dap").continue()
        end,
        desc = "Start",
      },
      {
        "<leader>rp",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>rC",
        function()
          require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<leader>rx",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>ru",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },

      {
        "<leader>dE",
        function()
          require("dapui").eval(vim.fn.input("[Expression] > "))
        end,
        desc = "Evaluate Input",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
        desc = "Evaluate",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Hover Variables",
      },
      {
        "<leader>dS",
        function()
          require("dap.ui.widgets").scopes()
        end,
        desc = "Scopes",
      },
      {
        "<leader>dU",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle UI",
      },
    },
    opts = {
      setup = {},
    },
    config = function(plugin, opts)
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      local dap, dapui = require("dap"), require("dapui")

      dap.adapters = {
        python = {
          type = "executable",
          command = GetPython(),
          args = { "-m", "debugpy.adapter" },
        },
      }

      dapui.setup({})

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- set up debugger
      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end,
  },
}
