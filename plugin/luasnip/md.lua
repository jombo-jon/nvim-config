-- Lua Snips for Markdown
local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial

local filename = function(_,snip) 
      local file = snip.env.TM_FILENAME 
      return file:match("(.*).md")
end 

-- ------------ SNIPPETS --------------
ls.add_snippets("md", {
  s({trig = "note", regTrig = true}, 
  fmt([[
---
date: {}
tags:
    -
hubs:
    - "[[]]"
urls:
    -
---

# {}
]],{ 
    f(os.date "%Y-%m-%d",{}),
    f(filename,{}),
  })
  ),
},
{
  key = "md",
})
