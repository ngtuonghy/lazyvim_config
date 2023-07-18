-- local omnisharp_mono = require("mason-lspconfig.server_configurations.omnisharp_mono")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- html = {},

      -- tsserver = {},
      --   cssls = {},
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    },
    require("lspconfig").lua_ls,
  },
}
