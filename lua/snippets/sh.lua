local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("sh", {
  s("rc", fmt([[
  cmake -B build
  cmake --build build
    ]], {
  }
  )),
})
