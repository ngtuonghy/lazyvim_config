------------
-- Beacon --
------------
return {
  "DanilaMihailov/beacon.nvim",
  config = function()
    return not vim.g.neovide
  end,
  event = "WinEnter",
}
