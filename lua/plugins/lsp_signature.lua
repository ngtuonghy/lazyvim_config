return {
  "ray-x/lsp_signature.nvim",
  config = function()
    local cfg = {
      floating_window = true,
      --      hint_prefix = "󰏚 ",
      max_height = 12, -- max height of signature floating_window
      max_width = 80, -- max_width of signature floating_window
      wrap = true,
      noice = false, -- set to true if you using noice to render markdown
      hint_scheme = "String",
      handler_opts = {
        border = "single", -- double, rounded, single, shadow, none, or a table of borders
      },
      select_signature_key = nil,
      doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
      -- set to 0 if you DO NOT want any API comments be shown
      -- This setting only take effect in insert mode, it does not affect signature help in normal
      -- mode, 10 by default
    } -- cycle to next signature, e.g. '<M-n>' function overloading}
    require("lsp_signature").setup(cfg)
  end,
}
