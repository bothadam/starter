local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Define snippets
ls.add_snippets("java", {
  s("ajb", {
    t('log.debug("ajb");'),
  }),
})
