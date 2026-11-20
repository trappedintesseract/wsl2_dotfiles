local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bellman", {
    t({
      "template <typename E>",
      "vector<long long> bellman(int n, const E &edges, int src) {",
      "  vector<long long> d(n + 1, LLONG_MAX);",
      "  d[src] = 0;",
      "  for (int it = 0; it < n - 1; it++)",
      "    for (auto &e : edges) {",
      "      long long u = e[0], v = e[1], w = e[2];",
      "      if (d[u] != LLONG_MAX && d[u] + w < d[v]) d[v] = d[u] + w;",
      "    }",
      "  return d;",
      "}",
    }),
  }),
})
