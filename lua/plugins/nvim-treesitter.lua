return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "json",
      "css",
      "tsx",
      "html",
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      -- list of languages you want to disable the plugin for
      disable = { "jsx" },
      -- Which query to use for finding delimiters
      --    query = "rainbow-parens",
      -- Highlight the entire buffer all at once
      -- strategy = require("ts-rainbow").strategy.global,
    },
  },
}
