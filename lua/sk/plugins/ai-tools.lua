return {
  -- FREE AI TOOLS ONLY

  -- Codeium - Completely FREE AI assistant (no API key required)
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Disable default tab binding to avoid conflicts
      vim.g.codeium_disable_bindings = 1
      
      -- Enable Codeium for all filetypes except sensitive ones
      vim.g.codeium_filetypes = {
        ["gitcommit"] = false,
        ["gitrebase"] = false,
        [".env"] = false,
        ["ssh_config"] = false,
        ["*"] = true,
      }
      
      -- Custom keybindings for Codeium
      local keymap = vim.keymap
      
      -- Insert mode bindings
      keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { 
        expr = true, 
        silent = true, 
        desc = "Accept Codeium suggestion" 
      })
      keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { 
        expr = true, 
        silent = true, 
        desc = "Next Codeium suggestion" 
      })
      keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { 
        expr = true, 
        silent = true, 
        desc = "Previous Codeium suggestion" 
      })
      keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { 
        expr = true, 
        silent = true, 
        desc = "Clear Codeium suggestion" 
      })
      
      -- Normal mode bindings for management
      keymap.set("n", "<leader>ce", ":CodeiumEnable<cr>", { desc = "Enable Codeium" })
      keymap.set("n", "<leader>cd", ":CodeiumDisable<cr>", { desc = "Disable Codeium" })
      keymap.set("n", "<leader>cs", ":CodeiumToggle<cr>", { desc = "Toggle Codeium" })
    end,
  },

  -- Supermaven - Another free AI completion tool
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { 
          gitcommit = true,
          gitrebase = true,
          [".env"] = true,
        },
        color = {
          suggestion_color = "#808080",
          cterm = 244,
        },
        log_level = "info",
        disable_inline_completion = false,
        disable_keymaps = false
      })
      
      -- Toggle Supermaven
      local keymap = vim.keymap
      keymap.set("n", "<leader>sm", ":SupermavenToggle<cr>", { desc = "Toggle Supermaven" })
    end,
    enabled = false, -- Enable if you want to try Supermaven instead of Codeium
  },

  -- FittenCode - Free AI coding assistant
  {
    "luozhiya/fittencode.nvim",
    config = function()
      require('fittencode').setup({
        delay_completion = {
          delaytime = 200,
        },
        inline_completion = {
          enable = true,
        },
        chat = {
          highlight_conversation_at_cursor = true,
        },
      })
      
      -- Keybindings for FittenCode
      local keymap = vim.keymap
      keymap.set('n', '<leader>fc', '<cmd>Fitten start_chat<cr>', { desc = 'Fitten Chat' })
      keymap.set('n', '<leader>fe', '<cmd>Fitten explain_code<cr>', { desc = 'Fitten Explain Code' })
      keymap.set('n', '<leader>fg', '<cmd>Fitten generate_code<cr>', { desc = 'Fitten Generate Code' })
      keymap.set('n', '<leader>fr', '<cmd>Fitten refactor_code<cr>', { desc = 'Fitten Refactor Code' })
      keymap.set('n', '<leader>ft', '<cmd>Fitten translate_code<cr>', { desc = 'Fitten Translate Code' })
      keymap.set('n', '<leader>fd', '<cmd>Fitten document_code<cr>', { desc = 'Fitten Document Code' })
    end,
    enabled = false, -- Enable if you want to try FittenCode
  },

  -- Avante.nvim - Free AI assistant for coding
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "openai",
      auto_suggestions_provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o-mini",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]k",
          prev = "[[k",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      diff = {
        autojump = true,
        list_opener = "copen",
      },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    enabled = false, -- Enable if you have OpenAI API key and want advanced features
  },
}
