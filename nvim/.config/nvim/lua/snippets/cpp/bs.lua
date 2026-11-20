local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bs", {
    t({
      "template <typename F>",
      "long long binary_search_answer(long long lo, long long hi, F pred) {",
      "  while (lo < hi) {",
      "    long long mid = lo + (hi - lo) / 2;",
      "    if (pred(mid)) hi = mid;",
      "    else lo = mid + 1;",
      "  }",
      "  return lo;",
      "}",
    }),
  }),
})
