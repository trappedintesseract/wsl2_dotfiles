local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("egcd", {
    t({
      "long long extgcd(long long a, long long b, long long &x, long long &y) {",
      "  if (b == 0) {",
      "    x = 1;",
      "    y = 0;",
      "    return a;",
      "  }",
      "  long long x1, y1;",
      "  long long g = extgcd(b, a % b, x1, y1);",
      "  x = y1;",
      "  y = x1 - (a / b) * y1;",
      "  return g;",
      "}",
    }),
  }),
})
