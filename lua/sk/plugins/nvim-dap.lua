return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = '<module',
        virt_text_pos = 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Key mappings
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>db", dap.step_back, { desc = "Debug: Step Back" })
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug: Continue" })
      vim.keymap.set("n", "<Leader>dC", dap.run_to_cursor, { desc = "Debug: Run to Cursor" })
      vim.keymap.set("n", "<Leader>dd", dap.disconnect, { desc = "Debug: Disconnect" })
      vim.keymap.set("n", "<Leader>dg", dap.session, { desc = "Debug: Get Session" })
      vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<Leader>dp", dap.pause, { desc = "Debug: Pause" })
      vim.keymap.set("n", "<Leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
      vim.keymap.set("n", "<Leader>ds", dap.restart, { desc = "Debug: Restart" })
      vim.keymap.set("n", "<Leader>dq", dap.close, { desc = "Debug: Quit" })
      vim.keymap.set("n", "<Leader>dU", function() dapui.toggle({ reset = true }) end, { desc = "Debug: Toggle UI" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    opts = {},
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
}