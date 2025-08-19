return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Patch the automatic enable feature to prevent the error
    local success, automatic_enable = pcall(require, "mason-lspconfig.features.automatic_enable")
    if success then
      -- Override the problematic init function
      automatic_enable.init = function() end
    end
    
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup mason-lspconfig with explicit handlers to avoid automatic enable
    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "pyright",
      },
      automatic_installation = false, -- Disable automatic installation
      automatic_setup = false, -- Disable automatic setup to prevent conflicts
      handlers = {
        -- Default handler that does nothing (prevents automatic setup)
        function(server_name) end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
      auto_update = false,
      run_on_start = false,
    })
  end,
}
