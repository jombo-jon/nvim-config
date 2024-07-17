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

-- function get_file_name(file)
--       local file_name = file:match("[^/]*.md$")
--       return file_name:sub(0, #file_name - 4)
-- end

local filename = function(_,snip) 
      local file = snip.env.TM_FILENAME 
      return file:match("(.*).md")
end 

-- ------------ SNIPPETS --------------
ls.add_snippets("markdown", {
-- ---------
-- note
  s({trig = "note", regTrig = true}, 
  fmt([[---
date: {}
para:
tags:
urls:
---

# {}
{}
]],{ 
    f(function () return os.date "%Y-%m-%d" end ),
    f(filename,{}),
    i(0),
  })
  ),
-- ---------
-- PARA
  s({trig = "para", regTrig = true}, 
  fmt([[---
date: {}
para: {},
tags:
urls:
---

# {}
{}
]],{ 
    f(function () return os.date "%Y-%m-%d" end ),
    c(1,{t("1_projects"), t("2_areas"), t("3_resources"),t("4_archives")}),
    f(filename,{}),
    i(0),
  })
  ),
-- ---------
-- c #1
  s({trig = "c ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = "`" .. snip.captures[1] .. "`"
      return sn(1, t(line))
    end),
    i(0)
  ),
-- ---------
-- cb 
  s({trig = "cb", regTrig = true}, 
  fmt([[```{}
{}
```]],{ 
    c(1,{
        i(nil,'yaml'),
        i(nil,'bash'),
        i(nil,'vhdl'),
        i(nil,'python'),
        i(nil,'json'),
    }),
    i(0),
  })
  ),
},
{
  key = "markdown",
})
