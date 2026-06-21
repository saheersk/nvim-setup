-- Compatibility shims for deprecated Neovim APIs that some plugins still call.
--
-- vim.lsp.buf_get_clients() was deprecated in 0.12 in favor of vim.lsp.get_clients().
-- project.nvim (on LSP attach -> printed at startup), telescope.nvim and nvim-dap-go
-- still call it, so Neovim prints a deprecation warning. Those plugins are already on
-- their latest versions, so there's nothing to update to.
--
-- We re-define the function with Neovim 0.12's exact implementation, minus the
-- vim.deprecate() call -> identical behavior (id-keyed map, same bufnr resolution),
-- just no warning. Delete this once those plugins migrate to vim.lsp.get_clients().
if vim.lsp and vim.lsp.get_clients and vim._resolve_bufnr then
  vim.lsp.buf_get_clients = function(bufnr)
    local result = {} --- @type table<integer,vim.lsp.Client>
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = vim._resolve_bufnr(bufnr) })) do
      result[client.id] = client
    end
    return result
  end
end
