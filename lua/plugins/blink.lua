return {
  -- Blink is already part of LazyVim 14, so the short name works
  "blink.cmp",

  opts = function(_, opts)
    ---------------------------------------------------------------------
    -- 1.  Make sure a keymap table exists, otherwise extending will fail
    ---------------------------------------------------------------------
    opts.keymap = opts.keymap or {}

    ---------------------------------------------------------------------
    -- 2.  Add your old <C-j>, <C-k>, <C-Space> behaviour
    --     Blink keymaps are **lists** of commands/functions, not mappings
    ---------------------------------------------------------------------
    opts.keymap["<C-j>"] = { "select_next", "fallback" }
    opts.keymap["<C-k>"] = { "select_prev", "fallback" }
    opts.keymap["<C-Space>"] = { "show", "show_documentation", "hide_documentation" }

    return opts
  end,
}
