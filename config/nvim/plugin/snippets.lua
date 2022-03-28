local luasnip = require("luasnip")

local languages = {
  "go",
  "javascript",
  "json",
  "lua",
  "python",
}

for _, language in ipairs(languages) do
  luasnip.add_snippets(language, require("config.snippets." .. language))
end
