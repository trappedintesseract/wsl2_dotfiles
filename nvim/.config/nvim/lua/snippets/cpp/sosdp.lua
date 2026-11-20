local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("sosdp", {
    t({
      "template <typename T>",
      "vector<T> subset_sums(vector<T> a, int bits) {",
      "  int N = 1 << bits;",
      "  for (int b = 0; b < bits; b++)",
      "    for (int mask = 0; mask < N; mask++)",
      "      if ((mask >> b) & 1) a[mask] += a[mask ^ (1 << b)];",
      "  return a;",
      "}",
      "",
      "template <typename T>",
      "vector<T> superset_sums(vector<T> a, int bits) {",
      "  int N = 1 << bits;",
      "  for (int b = 0; b < bits; b++)",
      "    for (int mask = 0; mask < N; mask++)",
      "      if (!((mask >> b) & 1)) a[mask] += a[mask | (1 << b)];",
      "  return a;",
      "}",
    }),
  }),
})
