-- Lua Snips for VHDL

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

local same = function(args)
  return f(function(arg)
    return arg[1]
  end, {args})
end

local shortreq = function(args)
  return f(function(arg)
    return arg[1]
  end, {args})
end

local paddtext = function(position)
  -- local fname = i .. string(" ",20 - #i);
  return d(position, function()
    local nodes = {}
    table.insert(nodes, i(1, "SignalName"))
    local fname = nodes[1][1] .. string.rep('.',5)
    return sn(nil, t(fname))
  end, {})
end

local has_value = function(value)
  print("Value: "..value)
  if value == "oth" then
    return ":= (others => '0');"
  elseif value == "0th" then
    return ":= (others => '0');"
  elseif value == "1th" then
    return ":= (others => '1');"
  elseif value == "" then
    return ";"
  elseif value == " " then
    return ";"
  elseif value ~= nil then
    return ":= " .. value .. ";"
  else
    return ";"
  end
end 

local filename = function(_,snip) 
      local file = snip.env.TM_FILENAME 
      return file:match("(.*).vhd")
end 

-- ------------ SNIPPETS --------------
ls.add_snippets("vhdl", {
  s({trig = "tb", regTrig = true}, 
  fmt([[
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity {} is 
end {};

architecture behavior of {} is
  -- Components
  {}

  -- Constant for Clock Genertion
  constant C_CLK_PERIOD : time := 1ns;

  -- Signals
  signal s_clk  : std_logic := '0';

begin

  -- Clock Generation
  clkgen : process
  begin 
    s_clk <= '1';
    wait for C_CLK_PERIOD/2;
    s_clk <= '0';
    wait for C_CLK_PERIOD/2;
  end process;

  -- Dut 
  

  -- ------------------
  -- Core TestBench
  -- ------------------
  process
  begin
    wait;
  end process;

end behavior;
]],{ 
    f(filename,{}),
    f(filename,{}),
    f(filename,{}),
    i(0)
  })
  ),
  s({trig = "vhdl", regTrig = true}, 
  fmt([[
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity {} is 
  generic (
    {}
  );
  port (

  );
end {};


architecture behavior of {} is

begin

end behavior;
]],{ 
    f(filename,{}),
    i(0),
    f(filename,{}),
    f(filename,{}),
  })
  ),
  s({trig = "pkg", regTrig = true}, 
  fmt([[
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package {} is 
{}
end {};

package body {} is

end {};
]],{ 
    f(filename,{}),
    i(0),
    f(filename,{}),
    f(filename,{}),
    f(filename,{}),
  })
  ),
  s({trig = "pro", regTrig = true}, 
  fmt([[
  process ({}) 
  begin
  end process;
]],{ 
    i(0),
  })
  ),

  -- Conditions 
  -- ------------------------------------
  s({trig = "if", regTrig = true}, 
  fmt([[
if {} then
end if;
]],{ 
    i(0),
  })
  ),
  s({trig = "ife", regTrig = true}, 
  fmt([[
if {} then
else
end if;
]],{ 
    i(0),
  })
  ),
  s({trig = "elif", regTrig = true}, 
  fmt([[
elsif {} then
]],{ 
    i(0),
  })
  ),
  s({trig = "wfa ([%a%d_-]+)", regTrig = true}, 
  fmt([[
wait until {}'event and {} = '0';
{}]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    rep(1),
    i(0)
  })
  ),
  s({trig = "wri ([%a%d_-]+)", regTrig = true}, 
  fmt([[
wait until {}'event and {} = '1';
{}]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    rep(1),
    i(0)
  })
  ),
  s({trig = "wz ([%a%d_-]+)", regTrig = true}, 
  fmt([[wait until {} = '0';
{}]], {
    d(1,function(_, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "wo ([%a%d_-]+)", regTrig = true}, 
  fmt([[wait until {} = '1';
{}]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "wu ([%a%d_-]+)", regTrig = true}, 
  fmt([[wait until {} {};]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "wf ([%a%d_-]+)", regTrig = true}, 
  fmt([[wait for {};
{}]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "case ([%a%d_-]+)", regTrig = true}, 
  fmt([[case {} is
  {}
  when others =>

end case;]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "wh", regTrig = true}, 
  fmt([[when {} =>]],{ 
    i(0),
  })
  ),
  -- Variables,
  -- ------------------------------------
  -- C_{UPPER} : 
  s({trig = "cst (.+)", regTrig = true}, 
  fmt([[{}{}]],{ 
    d(1,function(args, snip) 
      local line = "constant C_" .. string.upper(snip.captures[1]) .. string.rep(" ",10 - #snip.captures[1]) .. ": "
      return sn(1, t(line))
    end),
    i(0),
  })
  ),
  -- Math Type
  s({trig = "real (.+)", regTrig = true}, 
  fmt([[{}
{}]],{ 
    d(1,function(args, snip) 
      local line = "real := " .. string.upper(snip.captures[1]) .. " ;"
      return sn(1, t(line))
    end),
    i(0),
  })
  ),
  s({trig = "int (.+)", regTrig = true}, 
  fmt([[{}
{}]],{ 
    d(1,function(args, snip) 
      local line = "integer := " .. string.upper(snip.captures[1]) .. " ;"
      return sn(1, t(line))
    end),
    i(0),
  })
  ),
  s({trig = "i ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = snip.captures[1].. "_i" .. string.rep(" ",10 - #snip.captures[1]) .. ": in   "
      return sn(1, t(line))
    end),
    i(0)
  ),
  s({trig = "in ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = snip.captures[1].. "_i" .. string.rep(" ",10 - #snip.captures[1]) .. ": in   "
      return sn(1, t(line))
    end),
    i(0)
  ),
  s({trig = "o ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = snip.captures[1].. "_o" .. string.rep(" ",10 - #snip.captures[1]) .. ": out  "
      return sn(1, t(line))
    end),
    i(0)
  ),
  s({trig = "out ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = snip.captures[1].. "_o" .. string.rep(" ",10 - #snip.captures[1]) .. ": out  "
      return sn(1, t(line))
    end),
    i(0)
  ),

  -- signal s_{} : {} :=
  s({trig = "s ([%a%d_-]+)", regTrig = true}, 
  fmt([[signal s_{} {}]],{ 
    d(1,function(args, snip) 
      local line = snip.captures[1] .. string.rep(" ",10 - #snip.captures[1]) .. ": "
      return sn(1, t(line))
    end),
    i(0),
  })
  ),
  -- std_logic
  s({trig = "slz", regTrig = true}, 
    t("std_logic := '0';"), i(0)
  ),
  s({trig = "sl", regTrig = true}, 
    t("std_logic "), i(0)
  ),
  s({trig = "svz", regTrig = true}, 
  fmt([[std_logic_vector({}) := (others => '0');]],{ 
    i(0)
  })
  ),
  s({trig = "sv", regTrig = true}, 
  fmt([[std_logic_vector({})]],{ 
    i(0)
  })
  ),
  -- Specific,
  -- ------------------------------------
  s({trig = "sz", regTrig = true}, 
  fmt([[ <= '0';
{}]],{ 
    i(0)
  })
  ),
  s({trig = "so", regTrig = true}, 
  fmt([[ <= '1';
{}]],{ 
    i(0)
  })
  ),
  s({trig = "ez", regTrig = true}, 
  fmt([[ = '0'{}]],{ 
    i(0)
  })
  ),
  s({trig = "eo", regTrig = true}, 
  fmt([[ = '1'{}]],{ 
    i(0)
  })
  ),
  s({trig = "iri", regTrig = true}, 
  fmt([[
if rising_edge({}) then
end if;]],{ 
    i(0)
  })
  ),
  s({trig = "ifa", regTrig = true}, 
  fmt([[
if falling_edge({}) then
end if;]],{ 
    i(0)
  })
  ),
  s({trig = "++([%a%d_-]+)", regTrig = true}, 
  fmt([[{} <= {} + 1;
{}]],{ 
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    same(1),
    i(0),
  })
  ),
  s({trig = "s2i", regTrig = true}, 
  fmt([[to_integer(unsigned({}))]],{ 
    i(0),
  })
  ),
  s({trig = "std2int", regTrig = true}, 
  fmt([[to_integer(unsigned({}))]],{ 
    i(0),
  })
  ),
  s({trig = "oth", regTrig = true}, 
  fmt([[(others => '0'){}]],{ 
    i(0),
  })
  ),
},
{
  key = "vhdl",
})
