return {
  -- Simplified productivity tools

  -- File manager / Explorer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
        float = {
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in floating window" })
    end,
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      
      -- Terminal keybindings
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      
      -- Custom terminals
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      local node = Terminal:new({cmd = "node", hidden = true})
      function _NODE_TOGGLE()
        node:toggle()
      end

      local python = Terminal:new({cmd = "python3", hidden = true})
      function _PYTHON_TOGGLE()
        python:toggle()
      end

      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
      keymap.set("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<cr>", { desc = "Toggle horizontal terminal" })
      keymap.set("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>", { desc = "Toggle vertical terminal" })
      keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle LazyGit" })
      keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { desc = "Toggle Node terminal" })
      keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "Toggle Python terminal" })
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = ''
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ''
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0
      }
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
      vim.g.mkdp_filetypes = {'markdown'}
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })
    end,
  },

  -- Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
        pre_save = nil,
      })
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })
      keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
      keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
    end,
  },

  -- Code documentation generation
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
        input_after_comment = true,
        languages = {
          lua = {
            template = {
              annotation_convention = "ldoc",
            },
          },
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
          rust = {
            template = {
              annotation_convention = "rustdoc",
            },
          },
          javascript = {
            template = {
              annotation_convention = "jsdoc",
            },
          },
          typescript = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
        },
      })
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>nf", function() require("neogen").generate({ type = "func" }) end, { desc = "Generate function annotation" })
      keymap.set("n", "<leader>nc", function() require("neogen").generate({ type = "class" }) end, { desc = "Generate class annotation" })
      keymap.set("n", "<leader>nt", function() require("neogen").generate({ type = "type" }) end, { desc = "Generate type annotation" })
      keymap.set("n", "<leader>nF", function() require("neogen").generate({ type = "file" }) end, { desc = "Generate file annotation" })
    end,
  },

  -- Task runner
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        templates = { "builtin", "user.cpp_build", "user.run_script" },
        strategy = {
          "toggleterm",
          direction = "horizontal",
          autos_croll = true,
          quit_on_exit = "success"
        },
        component_aliases = {
          default = {
            { "display_duration", detail_level = 2 },
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            "on_complete_dispose",
          },
        },
      })
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>oo", ":OverseerToggle<cr>", { desc = "Toggle Overseer" })
      keymap.set("n", "<leader>or", ":OverseerRun<cr>", { desc = "Run task" })
      keymap.set("n", "<leader>oa", ":OverseerTaskAction<cr>", { desc = "Task action" })
      keymap.set("n", "<leader>oi", ":OverseerInfo<cr>", { desc = "Overseer Info" })
    end,
  },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath("data"),
      })
      require('telescope').load_extension('projects')
      
      -- Keybindings
      local keymap = vim.keymap
      keymap.set("n", "<leader>fp", ":Telescope projects<cr>", { desc = "Find Projects" })
    end,
  },
}
