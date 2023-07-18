return {
  "aurum77/live-server.nvim",
  config = function()
    require("live_server").setup({
      port = 8080,
      browser_command = "", -- Empty string starts up with default browser
      quiet = true,
      no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
      install_path = vim.fn.stdpath("config") .. "/live-server/",
    })
  end,
}
