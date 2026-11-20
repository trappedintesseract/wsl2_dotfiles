local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("ternary", {
    t({
      "template <typename F>",
      "long long ternary_max(long long lo, long long hi, F f) {",
      "  while (hi - lo > 2) {",
      "    long long m1 = lo + (hi - lo) / 3;",
      "    long long m2 = hi - (hi - lo) / 3;",
      "    if (f(m1) < f(m2)) lo = m1 + 1;",
      "    else hi = m2 - 1;",
      "  }",
      "  long long best = f(lo);",
      "  for (long long x = lo; x <= hi; x++) best = max(best, f(x));",
      "  return best;",
      "}",
    }),
  }),
})
