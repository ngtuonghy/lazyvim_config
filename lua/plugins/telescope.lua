return {
  "nvim-telescope/telescope.nvim",
  config = function()
    ---
    -- the code to configure the plugin
    ---
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local sorters = require("telescope.sorters")
    local dropdown = require("telescope.themes").get_dropdown()

    local function next_color(prompt_bufnr)
      actions.move_selection_next(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)
    end
    local function prev_color(prompt_bufnr)
      actions.move_selection_previous(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)
    end
    local function enter(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)

      local init = vim.fn.expand("~/kholuutru/init.txt")
      local job_cmd = "sed -i '4d'" .. init .. "&& echo" .. cmd .. ">>" .. init
      vim.fn.jobstart(job_cmd)

      actions.close(prompt_bufnr)
    end

    local colors = vim.fn.getcompletion("", "color")

    local opts = {
      finder = finders.new_table(colors),
      sorter = sorters.get_generic_fuzzy_sorter({}),

      attach_mappings = function(_, map)
        map("i", "<CR>", enter)
        map("i", "<C-J>", next_color)
        map("i", "<C-K>", prev_color)

        map("i", "<CR>", enter)
        map("i", "<j>", next_color)
        map("i", "<k>", prev_color)
        return true
      end,
    }
    --  local colors = pickers.new(dropdown, opts)
    --  colors:find()
  end,
}
--colors:find()
