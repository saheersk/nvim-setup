return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- lazy-load on the commands / keys below
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewFileHistory",
  },
  keys = {
    -- diffs: <leader>g* (Go owns most of this namespace, these sub-keys are free)
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open (working tree vs HEAD)" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: current file history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: repo history" },
  },
  opts = {
    enhanced_diff_hl = true, -- clearer added/removed highlighting inside diffs
    -- During a merge, `:DiffviewOpen` shows a 3-way view. Default conflict
    -- keymaps inside that view (buffer-local, no global conflict):
    --   <leader>co take OURS   <leader>ct take THEIRS
    --   <leader>cb take BASE   <leader>ca take ALL
    --   ]x / [x  jump to next / prev conflict
    --   dx       delete the conflict region
    view = {
      merge_tool = {
        layout = "diff3_mixed", -- OURS | result | THEIRS, with base folded in
      },
    },
  },
}
