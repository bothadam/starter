-- Configure mini.pairs to disable only quotes and double quotes
return {
  {
    "echasnovski/mini.pairs",
    opts = {
      -- Disable specific pairs while keeping others
      mappings = {
        -- Disable quotes
        ["'"] = false,
        ['"'] = false,
        -- Keep other pairs like brackets, parentheses, etc.
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\).]" },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\].]" },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\}.]" },
      },
    },
  },
}
