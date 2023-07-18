return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "clangd",
      "pyright",
      "jdtls",
      "csharp-language-server",
      "emmet-ls",
      "prettier",
      "css-lsp",
      -- "rome",
      -- "flake8",
    },
  },
}
