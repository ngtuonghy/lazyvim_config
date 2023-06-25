return {
  "telescope.nvim",
  dependencies = {
    -- "nvim-telescope/telescope-fzf-native.nvim",
    "sopa0/telescope-makefile",
    -- build = "make",
    config = function()
      require("telescope-makefile").setup({
        -- The path where to search the makefile in the priority order
        makefile_priority = { ".", "build/" },
        default_target = "[DEFAULT]", -- nil or string : Name of the default target | nil will disable the default_target
        make_bin = "make", -- Custom makefile binary path, uses system make by def
      })
      require("telescope").load_extension("make")
    end,
  },
}
