return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Go adapter
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        }),
      },
      discovery = {
        enabled = false,
      },
    })

    -- Key mappings for testing
    local keymap = vim.keymap
    keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
    keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run current file tests" })
    keymap.set("n", "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, { desc = "Debug nearest test" })
    keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
    keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "Show test output" })
    keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Toggle test output panel" })
    keymap.set("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop test" })
  end,
}