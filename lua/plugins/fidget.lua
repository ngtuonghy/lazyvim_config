return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      text = {
        spinner = "pipe", --[[  dots dots negative dots_snake dots_footsteps dots_hop line pipe dots_ellipsis dots_scrolling start flip	hamburger	grow_vertical	grow_horizontal	noise	dots_bounce	triangle	arc	circle	square_corners	circle_quarters	circle_halves	dots_toggle	box_toggle	arrow	zip	bouncing_bar	bouncing_ball	clock	earth	moon	dots_pulse	meter ]] -- animation shown when tasks are ongoing
        done = "", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
      window = {
        relative = "editor",
      },
    })
  end,
}
