return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Disable builtin LSP inlay hints by default
    inlay_hints = { enabled = false },
    servers = {
      omnisharp = {
        on_attach = function(client)
          -- OmniSharp can request hints against a stale document range and throw -32603.
          client.server_capabilities.inlayHintProvider = nil
        end,
      },
    },
  },
}
