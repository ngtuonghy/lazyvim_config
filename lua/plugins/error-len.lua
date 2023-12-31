return {
  "chikko80/error-lens.nvim",
  event = "LspAttach",
  opts = {
    -- your options go here
    auto_adjust = {
      enable = false,
      theme_bg = nil, -- mandatory if enable true (e.g. #281478)
      step = 5, -- inc: colors should be brighter/darker
      total = 30, -- steps of blender
    },
    disable_vt = true, -- disable vim.diagnostic virtual_text
    prefix = 5, -- distance code <-> diagnostic message
    -- default colors
    colors = {
      error_fg = "#ff6464", -- diagnostic font color
      error_bg = "#392d3e", -- diagnostic line color
      warn_fg = "#fa973a",
      warn_bg = "#3c343a",
      info_fg = "#06b7e4",
      info_bg = "#1f3b51",
      hint_fg = "#25E64B",
      hint_bg = "#233745",
    },
  },
}
