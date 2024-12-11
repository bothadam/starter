local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  javascript = { -- Ensure it's scoped to the javascript filetype
    s("ajb", {
      t('console.log("ajb ", );'),
    }),
  },
}

