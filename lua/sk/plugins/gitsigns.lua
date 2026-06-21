return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- GitLens-style inline blame on the current line (toggle with <leader>gB)
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 300,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation between hunks (no leader -> no conflict with Go maps)
      map("n", "]h", function() gs.nav_hunk("next") end, "Next git hunk")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Prev git hunk")

      -- Inspect (these <leader>g* sub-keys are free; Go owns gs/gc/gt/gr/gf/gi/gm)
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line (full)")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")

      -- Discard local changes (staging is done in lazygit / diffview)
      map("n", "<leader>gx", gs.reset_hunk, "Reset (discard) hunk")
      map("v", "<leader>gx", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset (discard) selected hunk")
      map("n", "<leader>gX", gs.reset_buffer, "Reset (discard) whole buffer")
    end,
  },
}
