local luasnip = require("luasnip")
local snippets = luasnip.snippets

local languages = {
  "go",
  "javascript",
  "json",
  "lua",
  "python",
}

for _, language in ipairs(languages) do
  snippets[language] = require("config.snippets." .. language)
end
