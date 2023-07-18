return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
      height = { min = 1, max = 20 }, -- min and max height of the columns
      width = { min = 20, max = 80 }, -- min and max width of the columns
      spacing = 1, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true,
    defaults = {
      mode = { "n", "v" },

      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "󰒭 next" },
      ["["] = { name = "󰒮 prev" },
      ["<leader><tab>"] = { name = "󰓩 tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = " code" },
      ["<leader>f"] = { name = "󰈞 file/find" },
      ["<leader>g"] = { name = "󰊢 git" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>q"] = { name = "󱂬 quit/session" },
      ["<leader>s"] = { name = " search" },
      ["<leader>u"] = { name = " UI/UX" },
      ["<leader>w"] = { name = " window" },
      ["<leader>x"] = { name = "󰁨 diagnostics/quickfix" },
    },
  },
}
