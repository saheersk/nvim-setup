return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        goimports = "gopls", -- goimports command, can be gopls or goimports
        gofmt = "gofumpt", -- gofmt cmd,
        max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
        tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
        gotests_template = "", -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
        comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        lsp_diag_hdlr = true, -- hook lsp diag handler
        lsp_diag_underline = true,
        lsp_diag_virtual_text = { space = 0, prefix = "■" },
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        gopls_remote_auto = true, -- add -remote=auto to gopls
        gocoverage_sign = "█",
        sign_priority = 5, -- change to a higher number to override other signs
        dap_debug = true, -- set to false to disable dap
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
        dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable
        dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pickup a random port
        dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
        dap_retries = 20, -- see dap option max_retries
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true, -- enable default textobjects through treesittter-text-objects
        test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
        verbose_tests = true, -- set to add verbose flag to tests
        run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
        floaterm = { -- position
          posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
          width = 0.45, -- width of float window if not auto
          height = 0.98, -- height of float window if not auto
        },
        trouble = false, -- true: use trouble to open quickfix
        test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
        luasnip = true, -- enable included luasnip snippets. B
        indent = false, -- keep indent consistent
        iferr_vertical_shift = 4, -- define where the cursor will end up vertically from the begining of if err statement
      })

      -- Run gofmt + goimports on save
      local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  }
}