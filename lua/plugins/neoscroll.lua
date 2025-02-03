return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      easing_function = "cubic", -- Animation easing function (default: quadratic)
      hide_cursor = true,        -- Hide cursor while scrolling
    })

    -- Define scroll mappings
    local mappings = {
      -- Syntax: t[keys] = {function_name, {arguments}}
      ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "200" } },                   -- Scroll down by half a screen
      ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } },                  -- Scroll up by half a screen
      ["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "400" } },  -- Full-page down
      ["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "400" } }, -- Full-page up
    }

    require("neoscroll.config").set_mappings(mappings)
  end,
}
