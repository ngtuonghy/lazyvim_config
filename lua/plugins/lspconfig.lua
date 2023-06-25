return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        tsserver = {},
        cssls = {},
      },
      require("lspconfig").lua_ls,
    },
  },
}
